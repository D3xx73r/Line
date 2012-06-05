class AddIndexToPorts < ActiveRecord::Migration
  def change
    add_index :ports, :city_id
  end
end
