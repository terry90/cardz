class CreateBusinesses < ActiveRecord::Migration[5.0]
  def change
    create_table :businesses do |t|
      t.string :name, null: false, unique: true
      t.timestamps
    end
  end
end
