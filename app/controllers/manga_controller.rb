class MangaController < ApplicationController


    def index 
      
      @mangas = Manga.all[:manga]
      @mangas.map!{|m| m.im = 'https://cdn.mangaeden.com/mangasimg/' + m.im}
      render json: @mangas

    end

    def show
      if params[:id].present?
        @manga = Manga.find(:id => params[:id])
        render json:{data:@manga}
      else
        render json:{error:'param not found'}
      end

    end


end
