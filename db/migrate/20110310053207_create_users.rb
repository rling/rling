class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
    t.string    :login,               :null => false                
    t.string    :email,               :null => false                
    t.integer   :role_id
    t.string    :hashed_password			             
    t.string    :salt
    t.string    :activation_key
    t.boolean   :is_activated, :default=>false
    t.string    :reset_password_key
    
    t.integer   :login_count,:default => 0
    t.integer   :failed_login_count,:default => 0
    t.datetime  :last_request_at
    t.datetime  :current_login_at
    t.datetime  :last_login_at
    t.string    :current_login_ip
    t.string    :last_login_ip
    
    t.timestamps
    end

    add_index :users, :login
    add_index :users, :email

  end

  def self.down
    drop_table :users
  end
end
