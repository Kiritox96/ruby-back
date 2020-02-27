
class MangaController < ApplicationController



    def show
      if params[:id].present?
        @manga = HTTParty.get('www.mangaeden.com/api/manga/' + params[:id])
        if @manga
          render json:@manga
        else
          render json:{error:'manga not found'}
        end
      else
        render json:{error:'param not found'}
      end

    end


end
