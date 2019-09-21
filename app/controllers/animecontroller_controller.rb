class AnimecontrollerController < ApplicationController
    def all_Anime

        @post = Anime.all
        
        
    end
end
