class Request < ApplicationRecord

  STATUSES = ['New', 'Pending', 'Retrieved', 'Given to researcher', 'Returned to SPCO', 'On Hold', 'Completed']

  belongs_to :user

  validates :identifier, presence: true
  validates :item_number, presence: true

  def self.to_csv
    header = ['request_id', 'spco_id', 'title', 'item_number', 'status', 'user_id']

    CSV.generate(headers: true) do |csv|
      csv<<header

      all.each do |request|
        csv<<[request.id, request.identifier, request.title, request.item_number, request.status, request.user.email]
      end
    end
  end

end
