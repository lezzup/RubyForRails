class CreateComposers < ActiveRecord::Migration
  def self.up
  end

  def self.down
    drop_table :composers
  end
end
