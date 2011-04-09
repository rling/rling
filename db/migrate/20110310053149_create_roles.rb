class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :role_type
      t.boolean :is_deletable, :default =>true

      t.timestamps
    end
  end

  def self.down
    drop_table :roles
  end
end
