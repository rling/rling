class CreateCategorysets < ActiveRecord::Migration
  def self.up
    create_table :categorysets do |t|
      t.string :name
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :categorysets
  end
end
