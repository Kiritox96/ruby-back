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
        elsif params[:type].present?
            if params[:type] == 'evidenza'
              evidenza = ['Black Clover','One Piece', 'Dragon Ball Heroes', 'Detective Conan', 'Boruto: Naruto Next Generations']
              list = archivio.select{|anime| evidenza.include?(anime[:name])}
              if list
                render json: list
              else
                render json: 444
              end
            elsif params[:type] == 'suggeriti'
              suggeriti = ['One Piece Movie 12: Z','Nanatsu no Taizai', 'Bungou Stray Dogs', 'The Ancient Magus Bride', 'Guilty Crown','Another','Quanzhi Gaoshou','Btooom!','Zetsuen no Tempest','God Eater','Angel Beats!','Bokura ga Ita','Si alza il vento','Another World','Piano no Mori (TV)']
              list = archivio.select{|anime| suggeriti.include?(anime[:name])}
              if list
                render json: list
              else
                render json: 444
              end
            else 
              render json: 444
            end
        else
            render json:{"404": "param not found"}
        end
    end

            
end
