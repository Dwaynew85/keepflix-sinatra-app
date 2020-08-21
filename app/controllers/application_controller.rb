require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "my_bizness_your_fassness"
  end

  get "/" do
    erb :welcome
  end

end
