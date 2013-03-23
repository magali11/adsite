class HomeController < ApplicationController
  def dashboard
  	
  end

  def my_ads
  	@ads = current_user.ads.all
  end
end
