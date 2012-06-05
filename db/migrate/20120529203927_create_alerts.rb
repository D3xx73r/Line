class CreateAlerts < ActiveRecord::Migration
  def change
    create_table :alerts do |t|
      t.integer :user_id
      t.time :alert_time

      t.timestamps
    end
  end
end
