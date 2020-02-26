class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = Manga.get_manga(params[:id])
        render json: @manga
      elsif params[:x].present?
        @manga = Manga.get_page(params[:x])
        render json: @manga
      else
        render json:{error:'param not found'}
      end

    end


end
