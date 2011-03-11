class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :role_type, :default => "true"
      t.boolean :is_deletable

      t.timestamps
    end
  Role.create :role_type => "admin"
  Role.create :role_type => "user"
  Role.create :role_type => "anonymous"
  end

  def self.down
    drop_table :roles
  end
end
