class Request < ApplicationRecord

  STATUSES = ['New', 'Pending', 'Retrieved', 'Given to researcher', 'Returned to SPCO', 'On Hold', 'Completed']

  belongs_to :user

  validates :identifier, presence: true
  validates :item_number, presence: true

  def self.export_requests(parameter=nil)
    header = ['request_id', 'spco_id', 'title', 'item_number', 'user_id']
    rows = []

    all.each do |request|
      if request.status == 'Completed'
        rows<<[request.id, request.identifier, request.title, request.item_number, request.user.email]
      end
    end

    ApplicationRecord.create_csv(header, rows)
  end

end
