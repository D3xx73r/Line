class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :phone
      t.string :email
      t.string :twitter

      t.timestamps
    end
  end
end
