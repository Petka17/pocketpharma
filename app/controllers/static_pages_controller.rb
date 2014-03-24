class StaticPagesController < ApplicationController
	
	before_filter :admin_check, only: [:manage]

  def home
  	redirect_to current_user unless current_user.nil?
  end

  def manage
  end

end
