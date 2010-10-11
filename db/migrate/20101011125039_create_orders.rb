class CreateOrders < ActiveRecord::Migration
  def self.up
    create_table :orders do |t|
      t.intiger :edition_id
      t.integer :customer_id
      t.integer :status

      t.timestamps
    end
  end

  def self.down
    drop_table :orders
  end
end
