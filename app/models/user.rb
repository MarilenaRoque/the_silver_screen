class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :authentication_keys => [:username]
  validates_uniqueness_of :username
  validates :username, presence: true
  has_many :articles, class_name: 'Article', foreign_key: 'author_id'
  has_many :votes
  has_many :bookmarks
end
