class Room < ApplicationRecord
  has_many :chats
  has_many :user_rooms #1つのルームにいるユーザー数は２人のため
end
