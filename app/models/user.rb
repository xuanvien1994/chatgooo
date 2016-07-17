class User < ApplicationRecord

	has_many :messages, foreign_key: :sender_id
	has_many :friendships
	has_many :friends, :through => :friendships
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
