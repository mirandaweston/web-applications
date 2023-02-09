require 'sinatra/base'
require "sinatra/reloader"
require './lib/postcode_checker'

class Application < Sinatra::Base
  configure :development do
    register Sinatra::Reloader
    also_reload 'lib/postcode_checker.rb'
  end

  get '/' do
    return erb(:index)
  end

  post '/check' do
    checker = PostcodeChecker.new
    postcode = params[:postcode]
    @valid = checker.valid?(postcode)
    return erb(:check)
  end
end