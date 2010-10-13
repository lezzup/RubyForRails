class EditionController < ApplicationController
  def show
    @edition=Edition.find(params[:id])
  end

end
