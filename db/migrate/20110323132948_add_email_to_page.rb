class AddEmailToPage < ActiveRecord::Migration
  def self.up
   add_column :pages, :email,:string
  end

  def self.down
   remove_column :pages, :email
  end
end
