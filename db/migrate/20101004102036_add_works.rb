class AddWorks < ActiveRecord::Migration
  def self.up
    create_table :works do |t|
      t.integer "composer_id"
      t.string "title"
    end
  end

  def self.down
  end
end
