class CreateCities < ActiveRecord::Migration
  def change
    create_table :cities do |t|
      t.string :name
      t.string :latitude
      t.string :longitude
      t.string :country_code
      t.string :state

      t.timestamps
    end
  end
end
