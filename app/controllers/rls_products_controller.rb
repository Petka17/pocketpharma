class RlsProductsController < ApplicationController
  
  def index
		@rls_products = RlsProduct.paginate(page: params[:page], per_page: 30)
  end

end
