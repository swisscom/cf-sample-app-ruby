Bundler.require :web
Bundler.require :development if development?

get '/assets/style.css' do
  scss :style
end

get '/' do
  haml :index
end

not_found do
  haml :'404'
end
