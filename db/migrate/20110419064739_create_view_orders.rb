class CreateViewOrders < ActiveRecord::Migration
  def self.up
    create_table :view_orders do |t|
      t.integer :view_id
      t.string :name
      t.string :order

      t.timestamps
    end
  end

  def self.down
    drop_table :view_orders
  end
end
