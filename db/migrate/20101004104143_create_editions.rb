class CreateEditions < ActiveRecord::Migration
  def self.up
  end

  def self.down
    drop_table :editions
  end
end
