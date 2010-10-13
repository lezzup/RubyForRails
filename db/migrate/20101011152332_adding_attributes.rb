class AddingAttributes < ActiveRecord::Migration
  def self.up
    add_column :composers,  :middle_name, :string
    add_column :composers, :birth_year, :integer
    add_column :composers, :death_year, :integer
    add_column :composers, :country, :integer
    add_column :editions, :len, :integer
    add_column  :works, :kee, :string
     add_column :works, :opus, :string
  end

  def self.down
    remove_column :composers,  :middle_name
    remove_column :composers, :birth_year
    remove_column :composers, :death_year
    remove_column :composers, :country
    remove_column :editions, :len
    remove_column  :works, :kee
    remove_column :works, :opus
  end
end
