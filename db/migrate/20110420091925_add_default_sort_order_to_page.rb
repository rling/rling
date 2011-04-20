class AddDefaultSortOrderToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :default_sort_order, :string
  end

  def self.down
    remove_column :pages, :default_sort_order
  end
end
