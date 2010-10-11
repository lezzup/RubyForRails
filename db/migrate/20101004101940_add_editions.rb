class AddEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|
      t.integer "work_id", :null => false 
      t.string "description", :limit => 30
      t.integer "publisher_id", :null => false
      t.integer "year"
      t.float "price"
    end



    # Test 2
    # Test
  end

  def self.down
  end
end
