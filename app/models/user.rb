class User < ApplicationRecord
  has_many :likes, dependent: :destroy
  has_many :liked_topics, through: :likes, source: :topic
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
