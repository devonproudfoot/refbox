class Request < ApplicationRecord

  belongs_to :user

  validates :identifier, presence: true

end
