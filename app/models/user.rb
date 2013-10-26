class User < ActiveRecord::Base
  has_many :privileged_sessions

  devise :database_authenticatable, :registerable, :rememberable, :trackable, :validatable

  def privileged?(key)
    return false unless key.present?
    !!privileged_sessions.active.exists?(key: key)
  end

  def revoke_privilege!(key)
    privileged_sessions.where(key: key).update_all(revoked_at: Time.now)
  end
end
