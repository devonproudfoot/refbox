class CreateRequests < ActiveRecord::Migration[5.2]
  def change
    create_table :requests do |t|
      t.string :identifier
      t.string :title
      t.string :creator
      t.integer :item_number
      t.integer :user_id
      t.timestamps
    end
  end
end
