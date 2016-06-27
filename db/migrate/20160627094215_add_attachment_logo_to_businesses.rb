class AddAttachmentLogoToBusinesses < ActiveRecord::Migration[5.0]
  def self.up
    change_table :businesses do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :businesses, :logo
  end
end
