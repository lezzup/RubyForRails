class Edition < ActiveRecord::Base
  has_and_belongs_to_many :works
  belongs_to :publisher
  has_many :orders
  def before_create
    self.description="standard" unless description
  end
end
