class WorldController < ApplicationController
  
    
    def index
      render json: World.limit(400)
    end

    def get_all
      World.all
    end
    def show
        @world = get_all
        if params[:name].present?
            list = @world.find_by(name:params[:name])
            if list
              render json: list
            else
              Raven.capture_message('Problema con la ricerca per name') 

              render json: 444
            end
        elsif params[:search].present?
            list =  World.where(name: /#{params[:search]}/i)
           # list = World.select{|anime| anime[:name].include?(params[:search])}
            if list
              render json: list
            else
              Raven.capture_message('Problema con il search') 

              render json: 444
            end
        elsif params[:random].present?
            if params[:random] == "1"
              render json: World.skip(rand(World.count)).first
            
            else
              Raven.capture_message('Problema con i random') 

              render json: 444
            end
        elsif params[:genere].present?
            list = @world.select{|anime| anime[:generi].include?(params[:genere])}
            if list
              render json: list
            else 
              Raven.capture_message('Problema con la ricerca per genere') 

              render json: 444
            end
        elsif params[:type].present?
            if params[:type] == 'evidenza'
              evidenza = ['One Piece', 'Black Clover', 'Dragon Ball Heroes', 'Detective Conan', 'Boruto: Naruto Next Generations']
              list = World.in(name:evidenza)
              if list
                render json: list
              else
                Raven.capture_message('Problema con evidenza') 

                render json: 444
              end
            elsif params[:type] == 'suggeriti'
              suggeriti = ['One Piece Movie 12: Z','Nanatsu no Taizai', 'Bungou Stray Dogs', 'Fairy Tail', 'Guilty Crown','Dr. Stone','Quanzhi Gaoshou','Btooom!','Zetsuen no Tempest','Fullmetal Alchemist','Angel Beats!','Bokura ga Ita','Naruto','Pandora Hearts','Piano no Mori (TV)']
              list = World.in(name:suggeriti)
              if list
                render json: list
              else
                Raven.capture_message('Problema con i suggeriti') 

                render json: 444
              end
            else 
              render json: 444
            end
        else
          Raven.capture_message('Parametri non trovati o invalidi') 
          render json:{"404": "param not found"}
        end
    end

            
end
