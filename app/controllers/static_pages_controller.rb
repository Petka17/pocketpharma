class StaticPagesController < ApplicationController
	
	before_filter :admin_check, only: [:manage]

  def home
  	redirect_to current_user unless current_user.nil?
  end

  def manage
  end

	private

		def admin_check
			redirect_to root_path unless signed_in? && current_user.admin?
		end

end
