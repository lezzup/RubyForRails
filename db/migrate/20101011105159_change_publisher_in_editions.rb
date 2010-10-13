class ChangePublisherInEditions < ActiveRecord::Migration
  def self.up
    add_column :editions, :publisher_id, :integer

    Edition.all.each do |e|
      p = Publisher.find_by_name(e['publisher']) || Publisher.create!(:name => e['publisher'])
      e.publisher_id = p.id
      e.save!
    end


    remove_column :editions, :publisher

  end

  def self.down
    remove_column :editions, :publisher_id

    add_column :editions, :publisher, :string
  end
end
