class FriendshipsController < ApplicationController
  before_action :set_friendship, only: [:show, :edit, :update, :destroy]

  # def current_user
  #   User.find_by id: session["current_user_id"]
  #   # or whatever
  # end
  helper_method :current_user

  # GET /friendships
  # GET /friendships.json
  def index
    @friendships = Friendship.where("user_id = ?",  params[:user_id])
    @friendname = User.where(id: @friendships.map(&:friend_id)).order('id ASC')
  end

  # GET /friendships/1
  # GET /friendships/1.json
  def show
    @friendships = Friendship.all

  end

  # GET /friendships/new
  def new
    @friendship = Friendship.new
  end

  # GET /friendships/1/edit
  def edit
  end

  # POST /friendships
  # POST /friendships.json
  def create
    # @friendship = Friendship.new(friendship_params)
    @friendship = current_user.friendships.build(:friend_id => params[:friend_id])

     if @friendship.save
      flash[:notice] = "Added friend."
      redirect_to root_url
    else
      flash[:error] = "Unable to add friend."
      redirect_to root_url
    end
  end

  # PATCH/PUT /friendships/1
  # PATCH/PUT /friendships/1.json
  def update
    respond_to do |format|
      if @friendship.update(friendship_params)
        format.html { redirect_to @friendship, notice: 'Friendship was successfully updated.' }
        format.json { render :show, status: :ok, location: @friendship }
      else
        format.html { render :edit }
        format.json { render json: @friendship.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friendships/1
  # DELETE /friendships/1.json


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friendship
      @friendship = Friendship.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friendship_params
      params.require(:friendship).permit(:user_id, :friend_id, :create, :destroy)
    end
end