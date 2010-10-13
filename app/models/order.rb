class Order < ActiveRecord::Base
  belongs_to :customer
  belongs_to :edition

  def before_create
    self.status="open"
  end
end
