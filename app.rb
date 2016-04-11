# require dependencies
Bundler.require :web
Bundler.require :development if development?

# serve stylesheet
get '/style.css' do
  scss :style
end

# our basic route which renders the index view
get '/' do
  haml :index
end

# our not-found route which serves the 404 view
not_found do
  haml :'404'
end
