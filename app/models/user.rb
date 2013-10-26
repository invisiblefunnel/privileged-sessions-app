class User < ActiveRecord::Base
  has_many :privileged_sessions

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def privileged?(key)
    return false unless key.present?
    privileged_sessions.active.where(key: key).exists?
  end

  def revoke_privileges!
    privileged_sessions.active.update_all(revoked_at: Time.now)
  end
end
