class TrackingNumbersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_tracking_number, :only => [:show]
  
  def new
    @tracking_number = TrackingNumber.new
  end

  def create
    @tracking_number = TrackingNumber.new(params[:tracking_number])
    @tracking_number.user = current_user
    @tracking_number.status = TrackingNumber::OPEN

    respond_to do |format|
      if @tracking_number.save
        format.html {redirect_to(tracking_number_path(@tracking_number), :notice => 'Número de objeto cadastrado com sucesso.')}
      else
        format.html {render :action => :new}
      end
    end
  end
  
  def show
  end

  private
    def find_tracking_number
      @tracking_number = TrackingNumber.find(params[:id])
    end
  
end
