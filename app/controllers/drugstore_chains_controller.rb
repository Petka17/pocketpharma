class DrugstoreChainsController < ApplicationController
  def index
  	@ds_chains = DrugstoreChain.all
  end

  def show
  	@ds_chain = DrugstoreChain.find(params[:id])
  end
end
