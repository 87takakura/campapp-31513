class ChatsController < ApplicationController
  def index
    @chats = Chat.all.order(id: "DESC")
  end

  def create
    chat = Chat.create(message: params[:message])
    render json:{ chat: chat }
  end

  def checked
    chat = Chat.find(params[:id])
    if chat.checked 
      chat.update(checked: false)
    else
      chat.update(checked: true)
    end

    item = Chat.find(params[:id])
    render json: { chat: item }
  end

  #def new
    #@chat = Chat.new
  #end

  #def edit
  #end
end
