 class AdvertisementsController < ApplicationController
  def index
    @advertisements = Advertisement.all
  end

  def show
    @advertisements = Advertisement.find(params[:id])
  end

  def new
    @advertisement = Advertisement.new
  end

  def create
    @advertisement = Advertisement.new
    @advertisement.title = params[:advertisment][:title]
    @advertisment.copy = params[:advertisment][:copy]
    @advertisment.price = params[:advertisment][:price]

     if @advertisment.save
       flash[:notice] = "Advertisement was saved."
       redirect_to @advertisment
     else
       flash[:error] = "There was an error saving the advertisment. Please try again."
       render :new
  end
end
end
