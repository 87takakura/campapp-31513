class ChatsController < ApplicationController
  def index
    @chats = Chat.all.order(id: "DESC")
  end

  def create
    Chat.create(create: params[:message])
    redirect_to action: :index
  end

  #def new
    #@chat = Chat.new
  #end

  #def edit
  #end
end
