class Request < ApplicationRecord

  belongs_to :user

  validates :identifier, presence: true
  validates :item_number, presence: true

end
