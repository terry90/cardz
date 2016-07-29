class AddFormattedNameToLocations < ActiveRecord::Migration[5.0]
  def self.up
    change_table :locations do |t|
      t.string :formatted_name
    end
  end

  def self.down
    remove_attachment :locations, :formatted_name
  end
end
