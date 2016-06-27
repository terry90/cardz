class AddAttachmentCoverToBusinesses < ActiveRecord::Migration[5.0]
  def self.up
    change_table :businesses do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :businesses, :cover
  end
end
