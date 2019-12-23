class Manga < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url



  get :all, "/list/1/"
end
