class AddLimitToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :limit, :integer
  end

  def self.down
    remove_column :pages, :limit
  end
end
