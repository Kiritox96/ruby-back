class WorldController < ApplicationController
  
    
    def index

        render json: World.all
    end

    def show
        archivio = World.all
        if params[:name].present?
            list = archivio.find_by(name:params[:name])
            if list
              render json: list
            else
              render json: 444
            end
        elsif params[:search].present?
            list = archivio.select{|anime| anime[:name].include?(params[:search])}
            if list
              render json: list
            else
              render json: 444
            end
        elsif params[:random].present?
            if params[:random] == "1"
              render json: archivio.sample
            elsif params[:random] == "4"
              render json: archivio.shuffle[0..3]
            else
              render json: 444
            end
        else
          render json:{"404": "param not found"}
        end
    end

            
end
