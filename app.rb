require 'sinatra'
require 'foursquare2'


  
configure do
  set :foursquare, Foursquare2::Client.new(:client_id => ENV['CLIENT_ID'], :client_secret => ENV['CLIENT_SECRET'], :api_version => '20151212')
end

get '/:venue' do
  content_type :json 
  settings.foursquare.venue(params[:venue])[:likes].to_json
end