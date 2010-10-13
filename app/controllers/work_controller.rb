class WorkController < ApplicationController
  helper :edition
  def show
    @work=Work.find(params[:id])
  end

end
