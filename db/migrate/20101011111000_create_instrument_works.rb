class CreateInstrumentWorks < ActiveRecord::Migration
  def self.up
    create_table :instruments_works, :id => false do |t|
      t.column :instrument_id, :integer
      t.column :work_id, :integer
    end
  end

  def self.down
    drop_table :instruments_works
  end
end
