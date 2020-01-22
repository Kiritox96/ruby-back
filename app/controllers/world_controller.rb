class WorldController < ApplicationController
  
    
    def index

        render json: World.all
    end

    def show
        archivio = World.all
        if params[:name].present?
          Thread.new do
            
          
            list = archivio.find_by(name:params[:name])
            if list
              render json: list
            else
              Raven.capture_message('Problema con la ricerca per name') 

              render json: 444
            end
          end
        elsif params[:search].present?
          Thread.new do

            list = archivio.select{|anime| anime[:name].include?(params[:search])}
            if list
              render json: list
            else
              Raven.capture_message('Problema con il search') 

              render json: 444
            end
          end
        elsif params[:random].present?
          Thread.new do

            if params[:random] == "1"
              render json: archivio.sample
            elsif params[:random] == "4"
              render json: archivio.shuffle[0..3]
            else
              Raven.capture_message('Problema con i random') 

              render json: 444
            end
          end
        elsif params[:genere].present?
          Thread.new do

            list = archivio.select{|anime| anime[:generi].include?(params[:genere])}
            if list
              render json: list
            else 
              Raven.capture_message('Problema con la ricerca per genere') 

              render json: 444
            end
          end
        elsif params[:type].present?
            if params[:type] == 'evidenza'
              Thread.new do

                evidenza = ['One Piece', 'Black Clover', 'Dragon Ball Heroes', 'Detective Conan', 'Boruto: Naruto Next Generations']
                list = archivio.select{|anime| evidenza.include?(anime[:name])}
                if list
                  render json: list
                else
                  Raven.capture_message('Problema con evidenza') 

                  render json: 444
                end
              end
            elsif params[:type] == 'suggeriti'
              Thread.new do

                suggeriti = ['One Piece Movie 12: Z','Nanatsu no Taizai', 'Bungou Stray Dogs', 'Fairy Tail', 'Guilty Crown','Dr. Stone','Quanzhi Gaoshou','Btooom!','Zetsuen no Tempest','Fullmetal Alchemist','Angel Beats!','Bokura ga Ita','Naruto','Pandora Hearts','Piano no Mori (TV)']
                list = archivio.select{|anime| suggeriti.include?(anime[:name])}
                if list
                  render json: list
                else
                  Raven.capture_message('Problema con i suggeriti') 

                  render json: 444
                end
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
