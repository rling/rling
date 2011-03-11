class CreateRoles < ActiveRecord::Migration
  def self.up
    create_table :roles do |t|
      t.string :role_type
      t.boolean :is_deletable, :default =>true

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
