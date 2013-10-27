class PrivilegedSession < ActiveRecord::Base
  belongs_to :user

  LIFESPAN = Integer(ENV['PRIVILEGE_LIFESPAN'] || 60)

  scope :active,   ->{ where("created_at > ? AND revoked_at IS ?", LIFESPAN.minutes.ago, nil) }
  scope :inactive, ->{ where("created_at < ? OR revoked_at IS NOT ?", LIFESPAN.minutes.ago, nil) }

  before_validation :set_unique_key, on: :create

  private

  def set_unique_key
    self.key = SecureRandom.urlsafe_base64(32)
  end
end
