class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = Manga.find(:id =>params[:id]).to_json
        if @manga
          render json:{data: @manga}
        else
          render json:{error:'manga not found'}
        end
      else
        render json:{error:'param not found'}
      end

    end


end
