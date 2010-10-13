class AddAttributeEdition < ActiveRecord::Migration
  def self.up
    add_column :editions, :title, :string
  end

  def self.down
    remove_column :editions, :title
  end
end
