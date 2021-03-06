class MainController < ApplicationController
  
  helper :composer, :work, :instrument
  def welcome
     @composers = Composer.find(:all).sort_by do |composer|
       [composer.last_name, composer.first_name, composer.middle_name]
     end
     @periods = Work.all_periods
     @instruments = Instrument.find(:all, :order => "name ASC" )
   end

   def show_period
     @period = params[:id]
     works = Work.find(:all).select do |work|
       (work.period == @period) || (work.century == @period)
     end
     @editions= Edition.of_works(works)
  end
end
