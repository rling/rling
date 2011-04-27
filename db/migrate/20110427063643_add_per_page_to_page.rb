class AddPerPageToPage < ActiveRecord::Migration
  def self.up
    add_column :pages, :per_page, :integer
  end

  def self.down
    remove_column :pages, :per_page
  end
end
