class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :set_camppost, only: [:create, :destroy]
  before_action :set_comment, only: [:destroy]
  before_action :move_to_index, only: [:destroy]

  def create
    #@camppost = Camppost.find(params[:camppost_id])
    @comment = current_user.comments.create(comment_params)
      if @comment.save
        redirect_to [@camppost]  
      else
        redirect_to root_path
      end
    end


  def destroy
    #raise params.inspect
    #@camppost = Camppost.find(params[:camppost_id])
    #@comment = @camppost.comments.find(params[:id])
    #comment = current_user.comments.find(params[:id])
    @comment.destroy

    redirect_to camppost_path(@camppost)
  end



private

def comment_params
  params.require(:comment).permit(:message).merge(camppost_id: params[:camppost_id], user_id: current_user.id)
end

def set_camppost
  @camppost = Camppost.find(params[:camppost_id])
end

def set_comment
  @comment = @camppost.comments.find(params[:id])
end

def move_to_index
  #@camppost = Camppost.find(params[:camppost_id])
  #@comment = @camppost.comments.find(params[:id])
  if @comment.user != current_user
    redirect_to camppost_path(@camppost) 
  end
 end

end