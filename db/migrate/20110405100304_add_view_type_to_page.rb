class AddViewTypeToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :view_type, :string
  end

  def self.down
    remove_column :pages, :view_type
  end
end
