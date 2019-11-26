class AnimeController < ApplicationController
  
    
    def index
        @anime= Anime.all
        render json:@anime
    end

    def show
        if params[:orders].present? and params[:genere].present? and params[:search].present?
            @animes = Anime.all
            src = @animes.select{|x| x[:name].include?(params[:search])}
            generi = src.select{|v| v[:episodi].include?(params[:genere])}
            ordine = []
            if params[:order] == '1'
              ordine = generi.sort_by{|s| s[:episodi].length}
            elsif params[:order] == '2'
              ordine = generi.sort_by{|s| s[:episodi].length}.reverse
            elsif params[:order] == '3'

            elsif params[:order] == '4'

            else
              render json:{error:'invalid params'}
            end

            render json:ordine
        elsif params[:order].present?
            ordine = []
            @animes = Anime.all
            if params[:order] == '1'
              ordine = @animes.sort_by{|x| x[:episodi].length}
            elsif params[:order] == '2'
              ordine = @animes.sort_by{|x| x[:episodi].length}.reverse
            end  
            
            if ordine
              render json:ordine
            else
              render json:{error:'order not found'}
            end
        elsif params[:search].present?
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
        elsif params[:genere].present?
            @animes = Anime.all
            list = []
            @animes.each do |v|
              if v['genere'].present?
                if v['genere'].include?(params[:genere])
                  list << v
                end
              end
            end
            if list 
              render json:list
            else
              render json:{error:'no list with this genere'}
            end
        else
            render json:{error:'param not found'}
        end
    end

            
end
