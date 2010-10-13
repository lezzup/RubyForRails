class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.integer :edition_id
      t.integer :customer_id
      t.string :status

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
