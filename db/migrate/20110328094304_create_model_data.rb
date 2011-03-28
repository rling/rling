class CreateModelData < ActiveRecord::Migration
  def self.up
    create_table :model_data do |t|
      t.integer :model_component_id
      t.integer :model_submission_id
      t.string :data_value

      t.timestamps
    end
  end

  def self.down
    drop_table :model_data
  end
end
