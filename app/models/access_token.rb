class AccessToken < ApplicationRecord
  validates_presence_of :kind, :expires_at
  validates_uniqueness_of :token
  before_validation :generate_token, on: :create

  enum :kind, [:cv]
  @@token_length = 16

  private

  def generate_token
    self.token = SecureRandom.hex(@@token_length)

    while AccessToken.exists?(token: self.token)
      self.token = SecureRandom.hex(@@token_length)
    end
  end
end
