class User < ActiveRecord::Base
  has_many :notes

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable
end
