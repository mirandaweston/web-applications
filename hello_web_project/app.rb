require 'sinatra/base'
require 'sinatra/reloader'

class Application < Sinatra::Base
  # This allows the app code to refresh
  # without having to restart the server.

  configure :development do
    register Sinatra::Reloader
  end

  post '/sort-names' do
    names = params[:names]
    names_array = names.split(",")
    names_sorted = names_array.sort.join(",")
    return names_sorted
  end
end