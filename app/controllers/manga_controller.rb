class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = Manga.get_manga(params[:id])
        render @manga
      else
        render json:{error:'param not found'}
      end

    end


end
