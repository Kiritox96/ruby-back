class Manga < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url



  get :get_manga, "/manga/:id"
end
