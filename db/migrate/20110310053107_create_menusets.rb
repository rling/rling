class CreateMenusets < ActiveRecord::Migration
  def self.up
    create_table :menusets do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :menusets
  end
end
