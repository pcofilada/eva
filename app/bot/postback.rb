Bot.on :postback do |postback|
  case postback.payload
  when 'GET_STARTED_PAYLOAD'
    get_started_response(postback)
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
