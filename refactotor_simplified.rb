def customer_state(session_id = nil)
    return { state: 'chat_disabled' } unless Setting.get('chat')
    reconnect_data = reconnect(session_id)
    return reconnect_data if reconnect_data
    return { state: 'offline' } if Chat.active_agent_count([id]).zero?
    waiting_count = Chat.waiting_chat_count(id)
    return { state: 'no_seats_available', queue: waiting_count} if waiting_count >= max_queue

    { state: 'online' }    
end

# reconnect
def reconnect (session_id)
    return chat_session = Chat::Session.find_by(session_id: session_id, state: %w[waiting running]) if session_id
    return unless chat_session
    return {state: 'reconnect', position: chat_session.position} elsif chat_session.state == 'waiting'
    return user = nil if chat_session.state == 'running'
    return chat_user = User.lookup(id: chat_session.user_id) if chat_session.user_id
    url = nil
    return url = "#{Setting.get('http_type')}://#{Setting.get('fqdn')}/api/v1/users/image/#{chat_user.image}" if chat_user.image && chat_user.image != 'none'
    session = Chat::Session.messages_by_session_id(session_id)
    return { state: 'reconnect', session: session, agent: user,} if session
    
end
