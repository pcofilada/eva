include Facebook::Messenger
require 'facebook/messenger'
require_relative './config'
require_relative './postback'

Facebook::Messenger::Subscriptions
  .subscribe(access_token: ENV['ACCESS_TOKEN'])
