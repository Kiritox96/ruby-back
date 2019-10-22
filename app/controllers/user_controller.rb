class UserController < ApplicationController
respond_to :json

  def index
    @user =  User.all
    render json:@user
  end

  def login
    @user = User.where('email = ? AND password = ?', params[:email], params[:password]).first
    if @user.present?
        render json: {id: @user.id, info: 'Use your token to make api calls'}
    else
        render json: {error: 'User not Found'}
    end
  end
  
  def show
    @user = User.find(params[:id])
    render json:@user
  end

  def create
    
    @user = User.create(user_params)
    render json:@user
    if @user.save
        render json: @user
    else
        render json: {error: 'process not completed'}
    end
  end

  def destroy
    @user = User.destroy(params[:id])
    if @user.destroy
        render json: {status: 'successful'}
    else
        render json: {error: 'process not completed'}
    end
  end

  def update
    user = User.find(params['id'])
    user.update(user_params)
    render json:user
  end

  private

  def user_params
    params.require(:user).permit(
      :id,
      :creation_date,
      :username,
      :email,
      :password,
      :lists
    )
  end
end
