class MangaController < ApplicationController

    def show
      base = 'https://www.mangaeden.com'
      if params[:id].present? 
        if params[:manga] == '1'
          source = base + '/api/manga/' + params[:id]
          @agent = Mechanize.new
          begin
            response = @agent.get(source)
            render json: response.body
            rescue Mechanize::ResponseCodeError 
            rescue Timeout::Error
            rescue Mechanize::RedirectLimitReachedError
            rescue StandardError
          end
        elsif params[:all].present? 
          if params[:page].present?
            if params[:count].present?
              source = base + '/api/list/' + params[:all] + '&p=' + params[:page] + '&l=' + params[:count]
              @agent = Mechanize.new
              begin
                response = @agent.get(source)
                render json: response.body
                rescue Mechanize::ResponseCodeError 
                rescue Timeout::Error
                rescue Mechanize::RedirectLimitReachedError
                rescue StandardError   
              end
            else
              source = base + '/api/list/' + params[:all] + '&p=' + params[:page]
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
            source = base + '/api/list/' + params[:all]
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
        elsif params[:capitolo] == '1'
          source = base + '/api/chapter/' + params[:id]
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
