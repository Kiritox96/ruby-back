class NotificationsController < ApplicationController
  # GET /notifications
  def index
    @nots = Notification.all
    render json:@nots
  end

  #POST /notifications
  def create
    @noty = Notification.new(notification_params)
    if @noty.save
      User.all.each { |n|
          n[:notification] = notification_params.as_json
          n.save!
      }
      render json:{ok: "notifica inserita"}
    else
      render json:{error: "notifica non inserita"}
    end
  end

  #POST /notifications
  def destroy 
    @user = User.find_by(username: params[:username])
    if @user
      @user[:notification] = nil
      @user.save!
      render json:{ok: "notifica cancellata", status: 200}
    else
      render json:{error: "user not found"}
    end
    
    
  end

  private 


  def notification_params
  
    params.permit(:title,:body)
  
  end


end
