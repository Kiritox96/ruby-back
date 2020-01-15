class Manga < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url



  get :find,  "/manga/:id"
  get :all, "/list/1/"
end
