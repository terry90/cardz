class AddAttachmentCoverToOfferReductions < ActiveRecord::Migration[5.0]
  def self.up
    change_table :offer_reductions do |t|
      t.attachment :cover
    end
  end

  def self.down
    remove_attachment :offer_reductions, :cover
  end
end
