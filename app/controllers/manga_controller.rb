class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = Manga.find(params[:id])
        render json: @manga
      else
        render json:{error:'param not found'}
      end

    end


end
