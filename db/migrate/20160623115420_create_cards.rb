class CreateCards < ActiveRecord::Migration[5.0]
  def change
    create_table :cards do |t|
      t.belongs_to :user, null: false
      t.string :uid, index: true, null: false
      t.timestamps
    end
  end
end
