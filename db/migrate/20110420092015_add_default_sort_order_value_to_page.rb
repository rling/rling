class AddDefaultSortOrderValueToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :default_sort_order_value, :string
  end

  def self.down
    remove_column :pages, :default_sort_order_value
  end
end
