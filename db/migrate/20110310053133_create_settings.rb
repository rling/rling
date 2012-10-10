class CreateSettings < ActiveRecord::Migration
  def self.up
    create_table :settings do |t|
      t.string :name
      t.string :desc_text
      t.text :setting_value
      t.string :setting_type
      t.timestamps
    end
  end

  def self.down
    drop_table :settings
  end
end
