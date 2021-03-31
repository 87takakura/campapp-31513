class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  #before_action :move_to_index, only: [:edit, :update, :destroy]

  def create
    @camppost = Camppost.find(params[:camppost_id])
    @comment = current_user.comments.new(comment_params)
      if @comment.save
        redirect_to [@camppost]  
      else
        redirect_to root_path
      end
    end


  def destroy
    comment = Comment.find(params[:camppost_id])
    #comment = current_user.comments.new(comment_params)

    comment.destroy

    redirect_to root_path
  end

end


private

def comment_params
  params.require(:comment).permit(:message).merge(camppost_id: params[:camppost_id])
end