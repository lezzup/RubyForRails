class InstrumentController < ApplicationController
  
  helper :edition, :work
  
  def show
    @instrument = Instrument.find(params[:id])
  end
  
end
