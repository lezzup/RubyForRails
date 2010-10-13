class Composer < ActiveRecord::Base
  has_many :works

   def editions
    works.map {|work| work.editions }.flatten.uniq
   end

  def publishers
    editions.map{|edition| edition.publisher}.uniq
  end
  
  def whole_name
      "#{first_name} #{middle_name} #{last_name}"
  end
  
  #class methods
  def Composer.sales_rankings
     r = Hash.new(0)
     rankings=Work.sales_rankings
     r_sorted=rankings.sort_by{|key,value| value}
     r_sorted.map do |work,sales|
       r[work] += sales
     end
     r
   end
end
