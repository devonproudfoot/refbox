class Request < ApplicationRecord

  STATUSES = ['New', 'Pending', 'Retrieved', 'Given to researcher', 'Returned to SPCO', 'On Hold', 'Completed']

  belongs_to :user

  validates :identifier, presence: true
  validates :item_number, presence: true

  def self.to_csv
    attributes = ['id', 'identifier', 'title', 'item_number', 'status']

    CSV.generate(headers: true) do |csv|
      csv<<attributes

      all.each do |request|
        csv<<request.attributes.values_at(*attributes)
      end
    end
  end

end
