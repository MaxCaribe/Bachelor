json.(conversation, :id)
json.message do
  json.partial! 'api/v1/messages/message', message: conversation.messages.last
end