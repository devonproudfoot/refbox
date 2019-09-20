class ChangeItemNumberDefaultForRequests < ActiveRecord::Migration[5.2]
  def change
    change_column_default :requests, :item_number, 1
  end
end
