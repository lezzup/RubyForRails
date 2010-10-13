class EditionController < ApplicationController
  
  helper :composer, :work
  def show
    @edition=Edition.find(params[:id])
  end

end
