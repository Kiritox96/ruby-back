class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = Manga.find(params[:id])
        if @manga
          render @manga
        else
          render json:{error:'manga not found'}
        end
      else
        render json:{error:'param not found'}
      end

    end


end
