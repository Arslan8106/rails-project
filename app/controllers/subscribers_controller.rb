class SubscribersController < ApplicationController
  
  def index
    @subscriber = Subscriber.all
  end

  # GET /comments/1 or /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    
    @subscriber = Subscriber.new

  end

  # GET /comments/1/edit
  def edit

  end

  def create
   @subscriber = Subscriber.new(subscriber_params)
   respond_to do |format|
    if @subscriber.save
       cookies[:save_lead] = true
       format.html { redirect_to root_path, notice: "Saved successfully"}
    else
        format.html {redirect_to root_path, notice: "Please fill up fields or Email already registerd" }
    end
   end
  end


  private
  def subscriber_params
    params.require(:subscriber).permit(:name, :email, :source)
  end
end


