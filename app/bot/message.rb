Bot.on :message do |message|
  if message.attachments
    case message.attachments[0]['type']
    when 'location'
      find_parking_spaces(message)
    end
  end
end

private

def find_parking_spaces(message)
  parking_lots = (1..10).to_a

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

  parking_lots.each do |parking_lot|
    rendered_parking_lots << {
      title: 'SM Megamall',
      subtitle: 'Your one stop parking lot.',
      buttons: [
        {
          type: 'web_url',
          url: 'http://facebook.com',
          title: 'Go now'
        }
      ]
    }
  end

  rendered_parking_lots
end
