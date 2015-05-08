require 'sinatra'
require 'sentimental'
require 'json'

get '/' do 
  content_type 'application/json'
  {
    greeting: 'hello'
  }.to_json
end

post '/echo' do
  content_type 'application/json'
  {
    params: params
  }.to_json
end

post '/sentiment' do
  text_to_analyse = params['text']
  Sentimental.load_defaults
  Sentimental.threshold = 0.1
  analyzer = Sentimental.new
  response = analyzer.get_sentiment text_to_analyse
  content_type 'application/json'
  {
    sentiment: response
  }.to_json
end
