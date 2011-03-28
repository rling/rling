class CreateObjectModels < ActiveRecord::Migration
  def self.up
    create_table :object_models do |t|
      t.string :name
      t.string :perma_link_parent
      t.text :description

      t.timestamps
    end
  end

  def self.down
    drop_table :object_models
  end
end
