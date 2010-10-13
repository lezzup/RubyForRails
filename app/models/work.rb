class Work < ActiveRecord::Base
  belongs_to :composer
  has_and_belongs_to_many :editions,  :order => "year ASC"
  has_and_belongs_to_many  :instruments

  PERIODS = { [1650..1750, %w{ EN DE FR IT ES NL}] => "Baroque",
              [1751..1810, %w{ EN IT DE NL }]      => "Classical",
              [1751..1830, %w{ FR }]               => "Classical",
              [1837..1901, %w{ EN }]               => "Victorian",
              [1820..1897, %w{ DE FR }]            => "Romantic" }


  def period
    pkey = PERIODS.keys.find do |yrange,countries|
      yrange.include?(year) && countries.include?(country)
    end
    PERIODS[pkey] || century
  end
  


  def publishers
    self.editions.map{|e| e.publisher.name}.uniq
  end

  def country
    composer.country
  end

  def orders_by
    editions.map{|e| e.orders}.flatten.map{|o| o.customer}.uniq
  end

  def key
    kee
  end

  def nice_instruments
    instr=instruments.map{|inst| inst.name}
    ordered=%{flute oboe violin viola cello piano orchestra}
    instr=instr.sort_by{|i| ordered.index(i) || 0}
    case instr.size
      when 0
        nil
      when 1
        instr[0]
      when 2
        instr.join(" and ")
      else
        instr[0..-2].join(", ") + ", and" + instrs[-1]

    end
  end

  def nice_opus
    if /^\d/.match(opus.to_s)
      "op. #{opus}"
    else
      opus
    end
  end

  def nice_title
    t,k,o,i=title, key, nice_opus, nice_instruments
    "#{t} #{"in #{k}" if k}#{", #{o}" if o}#{", for #{i}" if i}"
  end


  def century
    c=(year -1).to_s[0,2].succ
    c+= case c
      when "21" then "st"
      else "th"
    end
    c+"century"
  end

#class methods
 def Work.all_periods
    find(:all).map {|c| c.period }.flatten.uniq.sort
 end

 def Work.sales_rankings
    r = Hash.new(0) #1
    find(:all).each do |work|
      work.editions.each do |ed|
        r[work.id] += ed.orders.size
      end
    end
    r
 end
  

end
