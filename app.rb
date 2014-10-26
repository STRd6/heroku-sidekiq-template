
require 'pry' if ENV["RACK_ENV"] == "development"
require 'sinatra'

get '/hi' do
  "Hello World!"
end
