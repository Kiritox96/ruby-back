
class MangaController < ApplicationController



    def show
      if params[:id].present?
        source = Manga.base_url + '/api/manga/' + params[:id]
        resp = Net::HTTP.get_response(URI.parse(source))
        data = resp.body
        result = JSON.parse(data)
        if result
          render result
        else
          render json:{error:'manga not found'}
        end
      else
        render json:{error:'param not found'}
      end

    end


end
