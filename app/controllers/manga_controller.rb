
class MangaController < ApplicationController

    def show
      if params[:id].present?
        source = Manga.base_url + '/api/manga/' + params[:id]
        @agent = Mechanize.new
        begin
          response = @agent.get(source)
          render json: response
          rescue Mechanize::ResponseCodeError 
          rescue Timeout::Error
          rescue Mechanize::RedirectLimitReachedError
          rescue StandardError
        end
      else
        render json:{error:'param not found'}
      end

    end


end
