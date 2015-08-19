class ConversationsController < ApplicationController
  before_action :authenticate_user!
  #before_action :get_conversation, except: [:index, :empty_trash]
  #before_action :get_box, only: [:index]

  def index
    @conversations = current_profile.conversations

  end

  def show
    @messages = load_conversation.messages
  end

  def mark_as_read
    @conversation.mark_as_read(current_profile)
    flash[:success] = 'The conversation was marked as read.'
    redirect_to conversations_path
  end

  def reply
    load_conversation
    Message.create(profile_id: current_profile.id, body: params[:body], conversation_id: @conversation.id)
    flash[:success] = 'Reply sent'
    redirect_to conversation_path(@conversation)
  end

  def destroy
    @conversation.move_to_trash(current_profile)
    flash[:success] = 'The conversation was moved to trash.'
    redirect_to conversations_path
  end

  def restore
    @conversation.untrash(current_profile)
    flash[:success] = 'The conversation was restored.'
    redirect_to conversations_path
  end

  def empty_trash
    @mailbox.trash.each do |conversation|
      conversation.receipts_for(current_profile).update_all(deleted: true)
    end
    flash[:success] = 'Your trash was cleaned!'
    redirect_to conversations_path
  end

  private

  def get_mailbox
    @mailbox ||= current_profile.mailbox
  end

  def load_conversation
    @conversation ||= Conversation.find(params[:id])
  end


  def get_box
    if params[:box].blank? or !["inbox","sent","trash"].include?(params[:box])
      params[:box] = 'inbox'
    end
    @box = params[:box]
  end
end