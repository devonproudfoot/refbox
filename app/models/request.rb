class Request < ApplicationRecord

  STATUSES = ['New', 'Pending', 'Retrieved', 'Given to researcher', 'Returned to SPCO', 'On Hold', 'Completed']

  belongs_to :user

  validates :identifier, presence: true
  validates :item_number, presence: true

end
