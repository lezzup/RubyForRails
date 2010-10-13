class ComposerController < ApplicationController
  
  helper  :work, :edition
  def show 
    @composer=Composer.find(params[:id])
  end

end
