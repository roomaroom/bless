class MessagesController < ApplicationController
  before_action :authenticate_user!

  def new
    @chosen_recipient = Profile.find_by(id: params[:to].to_i) if params[:to]
  end

  def create
    recipients = Profile.where(id: params['recipients'])
    conversation = current_profile.send_message(recipients, params[:message][:body], params[:message][:subject]).conversation
    flash[:success] = "Message has been sent!"
    redirect_to conversation_path(conversation)
  end
end