class ChatRoom < ApplicationRecord
    has_many :admissions
    has_many :users, through: :admissions
    has_many :chats
    
    after_commit :create_chat_room_notification, on: :create
    
    def create_chat_room_notification
        #(channel_name, event_name, data)
        Pusher.trigger('chat_room', 'create', self.as_json)
        
    end
    
    def user_admit_room(user) # 현재 유저 정보가 모델까지 넘어오지 않으므로 파라미터로 받는다. 
       Admission.create(user_id: user.id ,chat_room_id: self.id)
       #현재 만들어지고 있는 챗룸이니까 self사용 
    end
end
