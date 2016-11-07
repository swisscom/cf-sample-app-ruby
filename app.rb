# require dependencies
Bundler.require :web
Bundler.require :development if development?

# check if running in the cloud and setting the MariaDB settings accordingly
if ENV['VCAP_SERVICES']
  vcap_services = JSON.parse(ENV['VCAP_SERVICES'])
  DB = Sequel.connect(vcap_services['mariadb'][0]['credentials']['uri'])
else
  DB = Sequel.connect('mysql://localhost:3306/dbname')
end

# create database table for our kittens
DB.create_table? :kittens do
  primary_key :id
  String :name
end

# serve stylesheet
get '/style.css' do
  scss :style
end

# our basic route which renders the index view
get '/' do
  haml :index
end

# endpoint to create a new kitten (e.g. /create-kitten?name=garfield)
post '/create-kitten' do
  kitten_name = params[:name]
  DB[:kittens].insert(:name => kitten_name)
  "Kitten #{kitten_name} added"
end

# here you can retrieve all the kittens in our MariaDB
get '/db' do
  content_type :json
  kittens = DB[:kittens].all
  kittens.to_json
end

# our not-found route which serves the 404 view
not_found do
  haml :'404'
end
