Facebook::Messenger::Profile.set(
  {
    get_started: {
      payload: 'GET_STARTED_PAYLOAD'
    }
  }, access_token: ENV['ACCESS_TOKEN']
)
