class MainController < ApplicationController
  def welcome
    @composers=Composer.find(:all).sort_by{|c|[c.last_name, c.first_name]}
  end

end
