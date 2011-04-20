class AddAssociatedViewToPages < ActiveRecord::Migration
  def self.up
    add_column :pages, :associated_view, :integer
  end

  def self.down
    remove_column :pages, :associated_view
  end
end
