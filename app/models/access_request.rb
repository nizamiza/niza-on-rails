class AccessRequest < ApplicationRecord
  belongs_to :access_token, optional: true

  validates_presence_of :kind, :name, :email
  validates_uniqueness_of :approval_token

  before_validation :generate_approval_token, on: :create

  enum :kind, [:cv]
  @@token_length = ENV["APPROVAL_TOKEN_LENGTH"].to_i

  def generate_approval_token
    self.approval_token = SecureRandom.hex(@@token_length)
  end
end
