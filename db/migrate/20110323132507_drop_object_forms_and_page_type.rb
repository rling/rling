class DropObjectFormsAndPageType < ActiveRecord::Migration
  def self.up
   #drop_table :object_forms
   execute "DROP TABLE IF EXISTS object_forms"
   add_column :pages, :type,:string

  end

  def self.down
   remove_column :pages, :type
  end
end
