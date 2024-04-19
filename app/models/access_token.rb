class AccessToken < ApplicationRecord
  has_one :access_request, dependent: :destroy

  validates_presence_of :kind, :expires_at
  validates_uniqueness_of :token

  before_validation :generate_token, on: :create

  enum :kind, [:cv]
  @@token_length = ENV["ACCESS_TOKEN_LENGTH"].to_i

  private

  def generate_token
    self.token = SecureRandom.hex(@@token_length)
  end
end
