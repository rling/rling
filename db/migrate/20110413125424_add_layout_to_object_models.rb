class AddLayoutToObjectModels < ActiveRecord::Migration
  def self.up
    add_column :object_models, :layout, :string
  end

  def self.down
    remove_column :object_models, :layout
  end
end
