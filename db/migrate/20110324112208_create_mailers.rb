class CreateMailers < ActiveRecord::Migration
  def self.up
    create_table :mailers do |t|
      t.string :handle
      t.string :subject
      t.text :body
      t.string :allowable_tags
      t.boolean :is_deletable, :default=>true

      t.timestamps
    end
  end

  def self.down
    drop_table :mailers
  end
end
