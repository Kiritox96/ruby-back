
class MangaController < ApplicationController

    def show
      if params[:id]-present? 
        if params[:manga] == '1'
          source = Manga.base_url + '/api/manga/' + params[:id]
          @agent = Mechanize.new
          begin
            response = @agent.get(source)
            render json: response.body
            rescue Mechanize::ResponseCodeError 
            rescue Timeout::Error
            rescue Mechanize::RedirectLimitReachedError
            rescue StandardError
          end
        elsif params[:capitolo] == '1'
          source = Manga.base_url + '/api/chapter/' + params[:id]
          @agent = Mechanize.new
          begin
            response = @agent.get(source)
            render json: response.body
            rescue Mechanize::ResponseCodeError 
            rescue Timeout::Error
            rescue Mechanize::RedirectLimitReachedError
            rescue StandardError
          end
        end
      else
        render json:{error:'param not found'}
      end

    end


end
