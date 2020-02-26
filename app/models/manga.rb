class Manga < ActiveRestClient::Base
  base_url Rails.application.config.api_server_url

  get :get_page, "/list/1/?p=5"

end
