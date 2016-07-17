class MessagesController < ApplicationController
	before_action :authenticate_user!
	 
	def new
		@message = Message.new
		@user = current_user.following
		@users = User.all
	end

	def create
		@message = current_user.messages.build(message_params)

		if @message.save
			flash[:success] = "Message Sent!"
			redirect_to root_path
		else
			flash[:alert] = "Great Scott!"
			render :new
		end
	end

	def index
		@messages = Recipient.where(:user_id => current_user.id).order("created_at DESC")
	end

	def new
		@message = Message.new
		# @recipients = User.all
		@friendships = Friendship.where("user_id = ?",  params[:user_id])
    	@recipients = User.where(id: @friendships.map(&:friend_id)).order('id ASC')
	end
	def friend
		@users = User.all
		@recipients = User.all
	end

	def show
		@message = Message.new
		@recipients = User.all
	end

	private

		def message_params
			params.require(:message).permit(:body, :content, :title, :thumbnail_url, :sender_id, user_tokens: [])
		end
end


