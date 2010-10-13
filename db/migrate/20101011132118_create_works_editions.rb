class CreateWorksEditions < ActiveRecord::Migration
  def self.up
    create_table :editions_works, :id => false do |t|
      t.column :edition_id, :integer
      t.column :work_id, :integer
    end
    remove_column :editions, :work_id
  end

  def self.down
    drop_table :editions_works
    add_column :editions, :work_id, :integer
  end
end
