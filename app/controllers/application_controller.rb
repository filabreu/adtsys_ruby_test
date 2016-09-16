class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  def webmotors_search(uri, search_params)
    # Search the models
    uri = URI(uri)

    # Request for Webmotors site
    response = Net::HTTP.post_form(uri, search_params)
    body = JSON.parse response.body

    body
  end

  protected

    def webmotors_params
      {}
    end
end
