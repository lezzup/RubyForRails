class AddEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.integer "work_id", :null => false 
      t.string "description" :limit => 30
      t.string "publisher" :limit => 60
      t.integer "year"
      t.float "price"
    end
    # Test 3
    # Test
  end

  def self.down
  end
end
