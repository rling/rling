class AddObjectFormIdToMailers < ActiveRecord::Migration
  def self.up
    add_column :mailers, :object_form_id, :integer
  end

  def self.down
    remove_column :mailers, :object_form_id
  end
end
