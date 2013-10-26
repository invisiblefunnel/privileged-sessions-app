class User < ActiveRecord::Base
  has_many :notes
  has_many :privileged_sessions

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
