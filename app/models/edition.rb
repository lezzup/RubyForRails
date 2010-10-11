class Edition < ActiveRecord::Base
  belongs_to :work
  belongs_to :publisher
  def before_create
    self.description="standard" unless description
  end
end
