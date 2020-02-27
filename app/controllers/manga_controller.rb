
class MangaController < ApplicationController



    def show
      if params[:id].present?
        response = HTTParty.get('www.mangaeden.com/api/manga/' + params[:id])
        if response.body
          render json:response.body
        else
          render json:{error:'manga not found'}
        end
      else
        render json:{error:'param not found'}
      end

    end


end
