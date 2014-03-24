class DrugstoreChainsController < ApplicationController
  def index
  	@ds_chains = DrugstoreChain.includes(:user)
  end

  def show
  	@ds_chain = DrugstoreChain.find(params[:id])
  end
end
