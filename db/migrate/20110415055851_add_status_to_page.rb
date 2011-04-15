class AddStatusToPage < ActiveRecord::Migration
  def self.up
     add_column :pages,:status,:string
  end

  def self.down
    remove_column :pages, :status
  end
end
