class AddComposers < ActiveRecord::Migration
  def self.up
    create_table :composers do |t|
      t.string "first_name"
      t.string "last_name"
    end
  end

  def self.down
  end
end
