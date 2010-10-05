class Edition < ActiveRecord::Base
  belongs_to :work
  def before_create
    self.description="standard" unless description
  end
end
