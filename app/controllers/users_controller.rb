class UsersController < ApplicationController
    before_action :find_user, except: %i[create index]
          

    # GET /users
    def index
        @users = User.all
        render json: @users, status: :ok
    end
                           
    
    # GET /users/{username}
    def show
        if params[:username].present?
          @user = User.find_by(username:params[:username])
          render json: @user, status: :ok
        else
          render json: {error:'no param'}
        end
    end
                                               
    
    # POST /users
    def create
        @user = User.new(user_params)
        if @user.save
            render json: @user, status: :created
        else
            render json: { errors: @user.errors.full_messages },
            status: :unprocessable_entity
        end
    end
    def update
        @user.update(user_params)
    end
    # DELETE /users/{username}
    def destroy
        @user = User.find_by(username:params[:username])
        if @user.destroy
          render json:{delete:'user deleted'}
        else
          render json:{error:'user not found'}
        end
    end
                     
    
    private
                           
    
    def find_user
        @user = User.find_by(username:params[:username])
        if !@user
          render json: { errors: 'User not found' }, status: :not_found
        else
          # cambiare parametri ogni volta che si aggiungo alcuni parametri 
          render json: {email: @user[:email], username: @user[:username]}
        end
    end
                                                         
    
    def user_params
        params.permit(:avatar, :name, :username, :email, :password, :password_confirmation)
    end
end
