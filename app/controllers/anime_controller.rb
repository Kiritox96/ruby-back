class AnimeController < ApplicationController
  
    
    def index
        @anime= Anime.all
        render json:@anime
    end
end
