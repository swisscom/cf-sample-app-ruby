# CF Sample App Ruby

A sample application to deploy to Cloud Foundry which works out of the box

## Run locally

1. Run `bundle install`
1. Run `bundle exec ruby app.rb -p 3000`
1. Visit [http://localhost:3000](http://localhost:3000)

## Run in the cloud

1. Run `cf push my-ruby-app -m 128M -n my-random-hostname` (replacing my-random-hostname with something creative)
1. Visit the given URL
