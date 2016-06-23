class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :user
      t.belongs_to :location, null: false
      t.string :uid, index: true, null: false, unique: true
      t.timestamps
    end
  end
end
