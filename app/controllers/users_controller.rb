class UsersController < ApplicationController
  skip_before_action :require_login, only: [:new, :create]

  def new
    @user = User.new
  end

  def show
    redirect_to block_path if current_user.block
    @users = User.all
  end

  def block
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login(params[:user][:email], params[:user][:password])
      flash[:success] = 'Welcome!'
      redirect_to root_path
    else
      flash.now[:alert] = 'Login failed'
      render 'new'
    end
  end

  def multiple_actions
    unless params[:user_id].nil?
      method_name = params[:commit].downcase.tr(' ', '_')
      public_send(method_name, params)
    end
    redirect_to root_path
  end

  def delete_selected(params)
      params[:user_id].each do |user_id|
        User.find(user_id).destroy
        session[user_id] = nil
      end
  end

  def unblock_selected(params)
      params[:user_id].each do |user_id|
        @user = User.find(user_id)
        @user.update_column(:block, false)
      end
  end

  def block_selected(params)
      params[:user_id].each do |user_id|
        @user = User.find(user_id)
        @user.update_column(:block, true)
        session[user_id] = nil
      end
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
