class CreatePorts < ActiveRecord::Migration
  def change
    create_table :ports do |t|
      t.integer :city_id
      t.string :port_number

      t.timestamps
    end
  end
end
