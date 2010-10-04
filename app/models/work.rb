class Work < ActiveRecord::Base
  belongs_to :composer
  has_many :editions
end
