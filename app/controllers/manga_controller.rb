class MangaController < ApplicationController


    def index 
      
      @mangas = Manga.all
      render json:{data:@mangas}

    end


end
