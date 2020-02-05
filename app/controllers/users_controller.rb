class UsersController < ApplicationController
    #skip_before_action :authenticate_request, only: %i[login register]

    # POST /register
     def register
       @user = User.create(user_params)
        
      if @user.save 
        @info = Info.create({email:params[:email]})

        @info.save
       response = { message: 'User created successfully'}
       render json: response, status: 200 #ok
      else
       render json: @user.errors, status: 400 #bad
      end 
     end

     def login
        authenticate params[:email], params[:password]
      end

      def test
        if params[:email].present? 
          if params[:type] == 'input'
            @info = Info.find_by(email:params[:email])
            @info['preferiti'] = params[:preferiti].split(',')
            list = []
            params[:attivita].split(',').map{|x| x.split('00xxnumxx00')}.each{|v| list.push({'anime':v[0],'episodio':v[1]})}
            @info['attivita'] = list
            if @info.save
              response = { message: 'User_info updated'}
              render json: response, status: 200
            else
              render json: {error:'problem with user info'}
            end
          elsif params[:type] == 'output'
            @info = Info.find_by(email:params[:email])
            if @info
              list = []
              @info['preferiti'].each{|x| list.push(World.find_by(name:x))}
              @info['preferiti'] = list
              render json: {data: @info}
            else
              render json: {error:'User info not found'}
            end
          else
            render json: {error:'param type invalid'}
          end
        end
      end
   
     private
   
     def authenticate(email, password)
        command = AuthenticateUser.call(email, password)
    
        if command.success?
          render json: {
            email: email,
            access_token: command.result,
            message: 'Login Successful'
          }
        else
          render json: { error: command.errors }, status: 401 #non autorizzato
        end
       end
    
     def user_params
       params.permit(
         :name,
         :email,
         :password
       )
     end
end
