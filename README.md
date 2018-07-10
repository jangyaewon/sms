20180710

PUSHER

- How?
- CUD Chatroom
- Join
- Chat



    # gemfile에 추가
    
    #pusher
    gem 'pusher'
    
    #authentication
    gem 'devise'
    
    # key encrypt pusher의 키를 저장한 걸 
    gem 'figaro'
    
    #gem 'turbolinks', '~> 5' 주석처리
    
    --------------------------------------------------------------------------------------------
    $ bundle install
    $ rails g devise:install
    $ rails g devise users  
    $ rails g scaffold chat_room
    $ rails g model chat
    $ rails g model admission
    
    
    
    

** counter cache ?

http://guides.rubyonrails.org/association_basics.html

    class Admission < ApplicationRecord
        belongs_to :user
        belongs_to :chat_room, counter_cache: true # 카운트를 쓰기 위해
    end
    

    $ rails c
    2.4.0 :001 > User.create(email: "aa@a.a", password: "123123",password_confirmation:"123123")
    2.4.0 :003 > u = User.find(1)
    2.4.0 :004 > ChatRoom.create(title: "어서와", master_id: User.first.email, max_count: 5)
    2.4.0 :008 > c = ChatRoom.find(2)
    2.4.0 :007 > Admission.create(user_id:u.id, chat_room_id: c.id)
    2.4.0 :009 > ChatRoom.first.admissions.size
     => 1 
    2.4.0 :010 > ChatRoom.first.admissions.count
     => 1 



https://dashboard.pusher.com/apps/557896/getting_started

     $ figaro install

config/applicaton.yml

    development:
        pusher_app_id: ~
        pusher_key: ~
        pusher_secret: ~
        pusher_cluster: ~
        pusher_logger: Rails.logger
        pusher_encrypted: true

config/initializers/pusher.rb를 만들고

    # config/initializers/pusher.rb
    require 'pusher'
    
    Pusher.app_id = ENV["pusher_app_id"]
    Pusher.key = ENV["pusher_key"]
    Pusher.secret = ENV["pusher_secret"]
    Pusher.cluster = ENV["pusher_cluster"]
    Pusher.logger = Rails.logger
    Pusher.encrypted = true

- 챗팅방이 만들어지자마자 반응하는


