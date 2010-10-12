class AddAttributeWork < ActiveRecord::Migration
  def self.up
    add_column :works, :year, :integer
  end

  def self.down
    remove_column :works, :year
  end
end
