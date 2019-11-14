def customer_state(session_id = nil)
  return { state: 'chat_disabled' } unless Setting.get('chat')
  reconnect_data = reconnect(session_id)
  return reconnect_data if reconnect_data
  return { state: 'offline' } if Chat.active_agent_count([id]).zero?
  waiting_count = Chat.waiting_chat_count(id)
  return { state: 'no_seats_available', queue: waiting_count} if waiting_count >= max_queue

  { state: 'online' }    
end

def reconnect(session_id)
  return unless session_id
  chat_session = Chat::Session.find_by(session_id: session_id, state: %w[waiting running])
  return unless chat_session
  
  case chat_session.state
  when 'running'
    reconect_seccion = reconnect_session(chat_session)
    return reconect_seccion if reconect_seccion  
  when 'waiting'
    {state: 'reconnect', position: chat_session.position,}

end

def reconnect_session(chat_session)
  user = nil
  return unless chat_session.user_id
  chat_user = User.lookup(id: chat_session.user_id)
  url = nil
  comparison = snake_comparison(chat_user, url)
  return comparation if comparation
end

def snake_comparison(chat_user, url)
  return unless chat_user.image && chat_user.image != 'none'
  url = "#{Setting.get('http_type')}://#{Setting.get('fqdn')}/api/v1/users/image/#{chat_user.image}"
  user = { name: chat_user.fullname, avatar: url,}
  get_position = queue_position(user)
  return get_position if get_position
end

def queue_position(user)
  session = Chat::Session.messages_by_session_id(session_id)
  return unless session
  {state: 'reconnect', session: session, agent: user}
end