#to run this program/file, rune 'ruby server.rb'
#open webpage name 'localhost:4567'

require 'sinatra'
require 'net/http'
require 'json'

helpers do
  def strip_url(url)
    url.match(/\/\/[a-zA-Z0-9\-\.]+/)[0].gsub(/\/\//, "")
  end
end

get '/' do
  response = Net::HTTP.get_response(URI.parse('http://api.ihackernews.com/page'))
  @result = JSON.parse(response.body)
  erb :index
end

get '/submit' do
  erb :show
end
