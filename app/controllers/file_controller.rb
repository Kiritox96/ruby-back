class FileController < ApplicationController
    def create
        @document = File.new(document_params)
        if @document.save
          render json: @document 
        else
          render json: @document.errors, status: :unprocessable_entity
        end
    end   
    private
    def document_params
        params.permit(files: []) # permit the files parameter.
    end
 end