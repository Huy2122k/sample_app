class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index,:edit, :update, :destroy]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: :destroy
  def new
    @user = User.new
  end
  def index
    @users = User.where(activated: true).paginate(page: params[:page], per_page: 10)
  end
  def show
    @user = User.find(params[:id])
    redirect_to root_url and return unless @user.activated?
    @microposts = @user.microposts.paginate(page: params[:page], per_page: 10)
  end
  def create
    @user = User.new(user_params)
    if @user.save
      # Handle a successful save.
      @user.send_activation_email
      # log_in @user
      # remember @user
      flash[:success] = "Registered successfully, Check your email to activate your account"
      redirect_to root_url
    else
      # binding.pry
      render :new, status: 422
    end
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      # Handle a successful update.
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render :edit, status: 422
    end
  end

  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end




  def correct_user
    @user = User.find(params[:id])
    redirect_to(root_url) unless current_user?(@user)
  end

  private
    def user_params
      params.require(:user).permit(:name, :email, :password,
      :password_confirmation)
    end
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
