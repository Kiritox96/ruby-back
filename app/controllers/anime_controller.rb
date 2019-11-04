class AnimeController < ApplicationController
  
    
    def index
        @anime= Anime.all
        render json:@anime
    end

    def show
        if params[:order].present?
            ordine = []
            if params[:order] == 'ordina_piu_episodi'
              @animes = Anime.all
              ordine = @animes.sort_by{|x| x[:episodi].length}
            elsif params[:order] == 'ordina_meno_episodi'
              @animes = Anime.all
              ordine = @animes.sort_by{|x| x[:episodi].length}.reverse
            end  
            
            if ordine
              render json:ordine
            else
              render json:{error:'order not found'}
            end
        elsif params[:type].present?
            
            if params[:type] == 'evidenza'
              list = ['one-piece-c','naruto-shippuden-c','detective-conan-a','boruto','naruto-c','fairy-tail-a','dragon-ball-z-c','hunter-x-hunter-2011-a','bleach-a','dragon-ball-super-a','black-clover','pokemon-a','gintama-a','inuyasha-a','fullmetal-alchemist-a']
                
                
                if list
                    render json:list
                else
                    render json:{error:'no list'}
                end
            elsif params[:type] == 'suggeriti'
              list = ['dr-stone','mahoutsukai-no-yome','bungou-stray-dogs','zatch-bell','ultimate-muscle','guilty-crown','capeta','quan-zhi-gao-shou','death-note-a','goblin-slayer','gto-great-teacher-onizuka','boku-dake-ga-inai-machi-erased-a','kiseijuu-sei-no-kakuritsu']
                
                if list
                    render json:list
                else
                    render json:{error:'no list'}
                end
            end
        else
            render json:{error:'param not found'}
        end
    end

            
end
