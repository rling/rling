class AddCategorysetIdToObjectModel < ActiveRecord::Migration
  def self.up
    add_column :object_models, :categoryset_id, :integer
  end

  def self.down
    remove_column :object_models, :categoryset_id
  end
end
