class CreateLocations < ActiveRecord::Migration[5.0]
  def change
    create_table :locations do |t|
      t.float :lat, null: false, index: true
      t.float :lng, null: false, index: true
      t.string :name, null: false
      t.belongs_to :business, null: false
      t.timestamps
    end
  end
end
