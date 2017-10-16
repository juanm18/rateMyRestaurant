class User < ActiveRecord::Base
  validates :username,:password, presence:true
  validates :username, length: {minimum: 4}
  validates :password, length: {minimum: 5}
end
