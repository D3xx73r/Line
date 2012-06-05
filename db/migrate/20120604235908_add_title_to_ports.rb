class AddTitleToPorts < ActiveRecord::Migration
  def change
    add_column :ports, :title, :string
  end
end
