class AddObjectModelIdToMailer < ActiveRecord::Migration
  def self.up
    add_column :mailers, :object_model_id, :integer
  end

  def self.down
    remove_column :mailers, :object_model_id
  end
end
