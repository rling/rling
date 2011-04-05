class AddViewForToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :view_for, :integer
  end

  def self.down
    remove_column :pages, :view_for
  end
end
