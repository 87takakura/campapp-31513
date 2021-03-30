class CamppostsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_camppost, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]


  def index
    @campposts = Camppost.order('created_at DESC')

  end

  def show
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


  def update
    if @camppost.update(camppost_params)
       redirect_to camppost_path(@camppost)
    else
      render :edit
    end
  end



  def edit
  end

  def destroy
    if @camppost.destroy
      redirect_to user_path(current_user)
    else
      redirect_to root_path
    end
  end

  private
   def set_camppost
    @camppost = Camppost.find(params[:id])
   end

   def camppost_params
    params.require(:camppost).permit(:name, :information, :prefecture_id, :city, :watersupply_id, :outlet_id, :toilet_id, :bath_id, :parking_id, :fire_id, :cargetin_id, :phone_number, :web_site, :image).merge(user_id: current_user.id)
   end
 
   def move_to_index
    if @camppost.user != current_user
      redirect_to camppost_path 
    end
   end
  end



