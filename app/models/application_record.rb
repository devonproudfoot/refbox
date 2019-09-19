class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def self.create_csv(header, rows)
    CSV.generate do |csv|

      csv<<header

      rows.each do |row|
        csv<<row
      end

    end
  end

end
