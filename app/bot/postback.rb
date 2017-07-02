Bot.on :postback do |postback|
  case postback.payload
  when 'GET_STARTED_PAYLOAD'
    get_started_response(postback)
  when 'SEND_RECEIPT_PAYLOAD'
    send_receipt(postback.sender['id'])
    thank_you(postback.sender['id'])
  end
end

private

def get_started_response(postback)
  get_started_intro(postback.sender['id'])
  get_started_question(postback.sender['id'])
end

def get_started_intro(sender_id)
  Bot.deliver(
    {
      recipient: {
        id: sender_id
      },
      message: {
        text: "Hello I'm EVA! I'm your parking assistant."
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end

def get_started_question(sender_id)
  Bot.deliver(
    {
      recipient: { id: sender_id },
      message: {
        text: "I'll find the nearest available parking space on your location. Just give me your location.",
        quick_replies: [
          {
            content_type: 'location'
          }
        ]
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end

def send_receipt(sender_id)
  Bot.deliver(
    {
      recipient: { id: sender_id },
      message: {
        attachment: {
          type: 'template',
          payload: {
            template_type: 'receipt',
            recipient_name: 'John Doe',
            order_number: '12345678902',
            currency: 'PHP',
            payment_method: 'Visa 2345',
            elements: [
              {
                title: 'Parking Fee',
                price: 50,
                currency: 'PHP'
              },
              {
                title: 'Service Charge',
                price: 5,
                currency: 'PHP'
              }
            ],
            summary: {
              subtotal: 50,
              total_tax: 5,
              total_cost: 55
            }
          }
        }
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end

def thank_you(sender_id)
  Bot.deliver(
    {
      recipient: {
        id: sender_id
      },
      message: {
        text: "Thank you!"
      }
    }, access_token: ENV['ACCESS_TOKEN']
  )
end
