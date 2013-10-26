class PrivilegedSession < ActiveRecord::Base
  belongs_to :user

  scope :active, ->{ where("created_at > ? AND revoked_at IS ?", 1.hour.ago, nil) }

  before_validation :set_unique_key, on: :create

  private

  def set_unique_key
    self.key = SecureRandom.urlsafe_base64(32)
  end
end
