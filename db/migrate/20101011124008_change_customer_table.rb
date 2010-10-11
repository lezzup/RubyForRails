class ChangeCustomerTable < ActiveRecord::Migration
  def self.up
    add_column :customers, :first_name, :string
    add_column :customers, :last_name, :string
    add_column :customers, :nick, :string
    add_column :customers, :password, :string
    add_column :customers, :email, :string
  end

  def self.down
    remove_column :customers, :first_name
    remove_column :customers, :last_name
    remove_column :customers, :nick
    remove_column :customers, :password
    remove_column :customers, :email
  end
end
