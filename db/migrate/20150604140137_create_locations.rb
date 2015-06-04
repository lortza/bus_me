class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :address
      t.string :city
      t.float :lat
      t.float :long

      t.timestamps null: false
    end
  end
end
