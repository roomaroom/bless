class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @chosen_recipient = Profile.find_by(id: params[:to].to_i) if params[:to]
  end

  def index
    @chosen_recipient = Profile.find_by(id: params[:to].to_i) if params[:to]
  end

  # def create
  #   recipients = Profile.where(id: params['recipients'])
  #   conversation = current_profile.send_message(recipients, params[:message][:body], 'View').conversation
  #   flash[:success] = "Message has been sent!"
  #   redirect_to conversation_path(conversation)
  # end

  def create
    #binding.pry
    if @conversation = Conversation.between(current_profile.id, params[:receiver_id]).first
      #@conversation = Conversation.between(params[:sender_id],params[:receiver_id]).first
    else
     @conversation = Conversation.create!(sender_id: current_profile.id, receiver_id: params[:receiver_id])
    end

    Message.create!(body: params[:body], profile_id: current_profile.id, conversation_id: @conversation.id )
    redirect_to :back
  end

  private
  def message_params
    params.permit(:body)
  end
end