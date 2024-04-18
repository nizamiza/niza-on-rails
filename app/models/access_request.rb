class AccessRequest < ApplicationRecord
  belongs_to :access_token
  validates_presence_of :kind, :requester

  enum :kind, [:cv]
end
