class UsersController < ApplicationController
  before_action :set_user, only: %i[ show edit update destroy ]

  # GET /users or /users.json
  def index
    @users = User.all
  end

  # GET /users/1 or /users/1.json
  def show
    @user = User.find_by(id: params[:id])
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
  end

  # POST /users or /users.json
  def create
    @user = User.new(user_params)
    @user.remote_avatar_url = params[:user][:image]
    if @user.save
      redirect_to user_path(@user), notice: 'Ban tao thanh cong'
    else
      # TODO
      render :new, alert: "Please sign in."
    end
  end

  # PATCH/PUT /users/1 or /users/1.json
  def update
    if @user.update(user_params)
      redirect_to @user, notice: 'Ban tao thanh cong'
    else
      render 'edit'
    end
  end

  # DELETE /users/1 or /users/1.json
  def destroy
    @user = User.find(params[:id])
    if @user.destroy
      redirect_to users_path, notice: "#{@user.name}-#{@user.email} was successfully destroyed."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
    end

    # Only allow a list of trusted parameters through.
    def user_params
      # strong parameter
      params.require(:user).permit(:name, :email)
    end
end
