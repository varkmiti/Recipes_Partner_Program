require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    erb :welcome
  end

  get "/recipes" do 
    erb :recipes
  end

  get "/recipes/new" do 
    erb :new
  end

  post "/recipes" do 
    Recipe.create(name: params[:name], 
    ingredients: params[:ingredients],
    instructions: params[:instructions],
    minutes: params[:minutes],
    difficulty: params[:difficulty])
    
    erb :recipes
  end

  get "/recipes/:id" do 
    @recipe = Recipe.find(params[:id].to_i)
    erb :show
  end

  # get "/recipes/:id/edit" do 
  #   erb :edit
  # end

  # get ""

end
