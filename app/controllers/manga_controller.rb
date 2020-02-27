
class MangaController < ApplicationController



    def show
      if params[:id].present?
        response = Net::HTTP.get_response(Manga.base_url, '/api/manga/' + params[:id])
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
