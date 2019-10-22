class UserController < ApplicationController

  def index
    @users =  User.all
    render json:@users
  end

  def show
    if params[:user_id].present?

        @user = User.find_by(user_id: params[:user_id])
	if @user
		render json: @user
    	else
		render json: {error: 'User with this id not found'}
	end
    else
        render json: {error: 'Param id not found'}
    end
  end  	

  def create
    @user = User.create(user_params)
    if @user.save
        render json: {status: 200 }
    else
        render json: {error: 'process not completed'}
    end
  end

  def destroy
    @user = User.destroy(params[:user_id])
    if @user.destroy
        render json: {status: 200 }
    else
        render json: {error: 'process not completed'}
    end
  end

  def update
    user = User.find(params[:user_id])
    user.update(user_params)
    render json:user
  end

  private

  def user_params
    params.permit(
      :user_id,
      :username,
      :email,
      :password
    )
  end
end
