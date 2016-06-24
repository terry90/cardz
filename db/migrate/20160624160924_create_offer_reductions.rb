class CreateOfferReductions < ActiveRecord::Migration[5.0]
  def change
    create_table :offer_reductions do |t|
      t.string :name
      t.integer :percent, null: false
      t.string :uid, null: false, unique: true
      t.belongs_to :location, foreign_key: true
      t.text :description
      t.string :title

      t.timestamps
    end
  end
end
