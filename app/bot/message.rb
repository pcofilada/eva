Bot.on :message do |message|
  if message.attachments
    case message.attachments[0]['type']
    when 'location'
      find_parking_spaces(message)
    end
  else
    if message.text == 'Please find me a parking slot'
      send_location(message.sender['id'])
    else
      general_response(message.sender['id'])
    end
  end
end

private

def find_parking_spaces(message)
  lat = message.attachments[0]['payload']['coordinates']['lat']
  lng = message.attachments[0]['payload']['coordinates']['long']
  parking_lots = Parking.by_distance(origin: [lat, lng]).limit(10)

  Bot.deliver(
    {
      recipient: { id: message.sender['id'] },
      message: {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'generic',
            elements: render_parking_card(parking_lots)
          }
        }
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end

def render_parking_card(parking_lots)
  rendered_parking_lots = []

  parking_lots.each do |parking|
    rendered_parking_lots << {
      title: parking.name,
      subtitle: "P#{parking.initial_rate} first 3 hrs, P#{parking.succeeding_rate} succeeding hr",
      buttons: [
        {
          type: 'web_url',
          url: 'http://facebook.com',
          title: 'Reserve now'
        }, {
          type: 'web_url',
          url: 'http://facebook.com',
          title: 'Check location'
        }, {
          type: 'phone_number',
          title: 'Contact',
          payload: parking.contact
        }
      ]
    }
  end

  rendered_parking_lots
end

def send_location(sender_id)
  Bot.deliver(
    {
      recipient: { id: sender_id },
      message: {
        text: "Ok I'll search the nearest available parking space near you. Just give me your location.",
        quick_replies: [
          {
            content_type: 'location'
          }
        ]
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end

def general_response(sender_id)
  Bot.deliver(
    {
      recipient: { id: sender_id },
      message: {
        text: "I don't know what are you talking about. Just give me your location and I'll search the nearest available parking space for you.",
        quick_replies: [
          {
            content_type: 'location'
          }
        ]
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end
