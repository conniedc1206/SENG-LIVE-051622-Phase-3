class ApplicationController < Sinatra::Base
  set :default_content_type, 'application/json'
  # this is where endpoints for our models are going to be defined
  # route route: landing page

  get "/" do
    # "hello world".to_json
    { hello: "world" }.to_json # serializing our data into JSON format
  end

end
