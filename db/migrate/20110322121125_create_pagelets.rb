class CreatePagelets < ActiveRecord::Migration
  def self.up
    create_table :pagelets do |t|
      t.string :handle
      t.text :display_text

      t.timestamps
    end
  end

  def self.down
    drop_table :pagelets
  end
end
