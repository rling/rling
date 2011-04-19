class CreateViewConditions < ActiveRecord::Migration
  def self.up
    create_table :view_conditions do |t|
      t.integer :view_id
      t.string :name
      t.string :value
      t.string :operator
      t.string :relation_with

      t.timestamps
    end
  end

  def self.down
    drop_table :view_conditions
  end
end
