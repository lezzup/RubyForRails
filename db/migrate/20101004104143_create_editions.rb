class CreateEditions < ActiveRecord::Migration
  def self.up
    create_table :editions do |t|

      t.timestamps
    end
  end

  def self.down
    drop_table :editions
  end
end
