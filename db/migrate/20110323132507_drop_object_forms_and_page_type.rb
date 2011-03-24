class DropObjectFormsAndPageType < ActiveRecord::Migration
  def self.up
   drop_table :object_forms
   rename_column :pages, :page_type, :type
  end

  def self.down
  end
end
