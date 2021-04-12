class ChatsController < ApplicationController
  def index
  end
 
  def show
    @camppost = Camppost.find(params[:camppost_id])
    @chat = Chat.find(params[:id])
    @chats = @camppost.chats.order(created_at: "DESC")
  end

  def create
    @camppost = Camppost.find(params[:camppost_id])
    @chat = Chat.new(chat_params)
    #render json:{ post: post}
    if @chat.save
      redirect_to camppost_chat_path(id:@camppost)
    else 
      render :show
    end
  end

  def destroy
    @camppost = Camppost.find(params[:camppost_id])
    @chat = Chat.find(params[:id])
    @chat.destroy
    render :index
  end

private

def chat_params
 params.require(:chat).permit(:message).merge(camppost_id: params[:camppost_id], user_id: current_user.id)
end


end