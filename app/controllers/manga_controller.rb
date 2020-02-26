class MangaController < ApplicationController



    def show
      if params[:x].present?
        @manga = Manga.get_page(params[:x])
        render json: @manga
      else
        render json:{error:'param not found'}
      end

    end


end
