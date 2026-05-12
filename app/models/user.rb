class User < ApplicationRecord
  has_secure_password
  has_many :posts, dependent: :destroy
  has_many :follows, foreign_key: :follower_id, dependent: :destroy
  has_many :followees, through: :follows, source: :followee
  has_many :sent_messages, class_name: "Message", foreign_key: :sender_id, dependent: :destroy
  has_many :received_messages, class_name: "Message", foreign_key: :receiver_id, dependent: :destroy
end
