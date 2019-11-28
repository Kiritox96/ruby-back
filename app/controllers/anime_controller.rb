class AnimeController < ApplicationController
  
    
    def index
        @anime= Anime.all
        render json:@anime
    end

    def show
        if params[:genere].present?
            @animes = Anime.all
            src = []
            if params[:src].present?
              src = @animes.select{|x| x[:name].include?(params[:src])}
            else
              src = @animes
            end
            generi = []
            if params[:genere].present?
              if params[:genere] == 'Tutti'
                generi = src
              else
                generi = src.select!{|v| v[:genere].include?(params[:genere])}
              end
            else
              generi = src
            end
            ordine = []
            if params[:order] == '1'
              ordine = generi.sort_by{|s| s[:episodi].length}
            elsif params[:order] == '2'
              ordine = generi.sort_by{|s| s[:episodi].length}.reverse
            elsif params[:order] == '3'
              ordine = generi
            elsif params[:order] == '4'
              ordine = generi
            else
              ordine = generi
            end
            render json:ordine
        else
            if params[:search].present?
              @animes = Anime.all
              src = @animes.select{|x| x[:name].include?(params[:search])}
              if src
                render json:src
              else
                render json:@animes
              end
            elsif params[:type].present?
            
              if params[:type] == 'evidenza'
                list = ['one-piece-c','naruto-shippuden-c','detective-conan-a','boruto','naruto-c','fairy-tail-a','dragon-ball-z-c','hunter-x-hunter-2011-a','bleach-a','dragon-ball-super-a','black-clover','pokemon-a','gintama-a','inuyasha-a','fullmetal-alchemist-a']
                @animes = Anime.all
                result = @animes.select{|x| list.include?(x['clean'])}
              
                if result
                  render json:result
                else
                  render json:{error:'no list'}
                end

              elsif params[:type] == 'suggeriti'
                list = ['dr-stone','mahoutsukai-no-yome','bungou-stray-dogs','zatch-bell','ultimate-muscle','guilty-crown','capeta','quan-zhi-gao-shou','death-note-a','goblin-slayer','gto-great-teacher-onizuka','boku-dake-ga-inai-machi-erased-a','kiseijuu-sei-no-kakuritsu']
                @animes = Anime.all
                result = @animes.select{|x| list.include?(x['clean'])}
                if result
                  render json:result
                else
                  render json:{error:'no list'}
                end
              end
          end
      end
    end

            
end
