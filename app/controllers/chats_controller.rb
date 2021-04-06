class ChatsController < ApplicationController
  def index
    @camppost = Camppost.find(params[:camppost_id])
    @chat = Chat.new
    @chats = @camppost.chats.order(id: "DESC")
  end
 
  def show
    @camppost = Camppost.find(params[:id])
    @chat = Chat.new
    @chats = @camppost.chats.order(id: "DESC")
  end

  def create
    @chat = Chat.new(chat_params)
    @chat.save
      redirect_to camppost_chat_path
      #render :index
  end

  def destroy
    @camppost = Camppost.find(params[:camppost_id])
    @chat = Chat.find(params[:id])
   if @chat.destroy
    render :index
   end
  end
  #def checked
    #chat = Chat.find(params[:id])
    #if chat.checked 
     # chat.update(checked: false)
    #else
     # chat.update(checked: true)
    #end

    #item = Chat.find(params[:id])
    #render json: { chat: item }
  #end

private

def chat_params
 params.require(:chat).permit(:message).merge(camppost_id: params[:camppost_id], user_id: current_user.id)
end


end
