class ChangeAttributeWork < ActiveRecord::Migration
  def self.up
    change_column :composers, :country, :string
  end

  def self.down
    change_column :composers, :country, :integer
  end
end
