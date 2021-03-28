class CamppostsController < ApplicationController
  def index
  end

  def show
    @camppost = Camppost.find(params[:id])
  end

  def new
    @camppost = Camppost.new
  end
 
  def create
   @camppost = Camppost.new(camppost_params)
     if @camppost.save
      redirect_to camppost_path(@camppost)
     else
      redirect_to root_path
     end
  end





 # def update
  #  @user = User.find(params[:id])
   # if @user.update(user_params)
    #   redirect_to user_path(@user)
    #else
     # render :edit
    #end
  #end



  def edit
  end

  private
   def camppost_params
    params.require(:camppost).permit(:name, :information, :prefecture_id, :city, :watersupply_id, :outlet_id, :toilet_id, :bath_id, :parking_id, :phone_number, :web_site, :image).merge(user_id: current_user.id)
   end
 


end
