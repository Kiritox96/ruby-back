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
    @mail=request.request_parameters[:mail]
    @pass=request.request_parameters[:pass]
    @name=request.request_parameters[:username]
    
    @user_id=request.request_parameters[:user_id]
    
    if @mail.present? and @pass.present? and @name.present? and @user_id.present?
       @user = User.new(:mail=>@mail,:password=>@pass,:username=>@user,:user_id=>@user_id)
       @user.save
      render json: {result:@user}
    else
      render json: {error:'invalid params'}
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
    @mail = request.request_parameters[:mail]
    @user_id = request.request_parameters[:user_id]
    @password = request.request_parameters[:password]
    @username = request.request_parameters[:username]
    @preferiti = request.request_parameters[:preferiti]
    @all = User.all
    @user = @all.select{ |el| el[:user_id] == @user_id}
    
    if @user_id.present?
      if @mail.present?
        @user[0][:mail] = @mail
        User.update(@user)
        render json: {result: @user}
      elsif @username.present?
        @user.update(:username=>@username)
        render json: {result: @user}
      elsif @password.present?
        @user.update(:password=>@password)
        render json: {result: @user}
      elsif @preferiti.present?
        @user.update(:preferiti=>@preferiti)
        render json: {result: @user}
      else
        render json:{error:'params invalid'}
      end
    else
      render json:{error:'user_id not found'}
    end
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
