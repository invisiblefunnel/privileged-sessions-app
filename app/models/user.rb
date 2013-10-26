class User < ActiveRecord::Base
  has_many :notes
  has_many :privileged_sessions

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def latest_active_privileged_session(key)
    privileged_sessions.active.where(key: key).order('created_at DESC').first
  end
end
