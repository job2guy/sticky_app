class ChatController < ApplicationController
  def index
  end
  def send_data
    render :update do |page|
      page.insert_html :top, 'chat_data', "<li>#{h params[:chat_input]}</li>"
    end
  end
end
