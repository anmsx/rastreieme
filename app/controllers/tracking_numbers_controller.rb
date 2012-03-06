class TrackingNumbersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_tracking_number, :only => [:show, :edit, :update]
  
  def new
    @tracking_number = TrackingNumber.new
  end

  def create
    number = params[:tracking_number][:number]

    
    if number.lines.count != 1
      return create_multi(params)
    end
    
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
  
  def update
    @tracking_number.update_attributes(params[:tracking_number])
    redirect_to(tracking_number_path(@tracking_number), :notice => 'Número de objeto atualizado com sucesso.') if @tracking_number.valid?
      render :action => :edit if !@tracking_number.valid?
  end
  
  def show
  end

  def edit
    
  end

  def multi
    @tracking_number = TrackingNumber.new
    @errors = @success = Array.new
  end

  private
    def create_multi(params)
      @errors = Array.new
      @success = Array.new
      number = params[:tracking_number][:number]
      number = number.lines.to_a.uniq.sort
      new_number = "#{number}"
      number.each do |n|
        tn = TrackingNumber.new
        tn.number = n.strip
        tn.user = current_user
        tn.status = TrackingNumber::OPEN
        if !tn.save
          tn.errors.to_a.each do |e|
            @errors.push "#{tn.number}: #{e}"
          end
        else
            new_number[n] = ''
            @success.push tn
        end
      end
      respond_to do |format|
        if !@errors
          format.html {redirect_to(tracking_numbers_multi_path, :notice => 'Números de objetos cadastrados com sucesso.')}
        else
          @tracking_number = TrackingNumber.new
          @tracking_number.number = new_number
          format.html {render :action => :multi}
        end
      end
    end

    def find_tracking_number
      @tracking_number = TrackingNumber.find(params[:id])
      raise 'Acesso negado' if @tracking_number.is_not_from_user current_user
    end
  
end
