require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get "/" do
    redirect '/recipes'
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
    
    redirect '/recipes'
  end

  get "/recipes/:id" do 
    @recipe = Recipe.find(params[:id].to_i)
    erb :show
  end

  get "/recipes/:id/edit" do 
    @recipe = Recipe.find(params[:id].to_i)
    erb :edit
  end
  
  put "/recipes/:id" do
    @recipe = Recipe.find(params[:id].to_i)
    @recipe.update(name: params[:name], 
    ingredients: params[:ingredients], 
    instructions: params[:instructions], 
    minutes: params[:minutes], 
    difficulty: params[:difficulty])

    redirect "/recipes/#{@recipe.id}"
  end

  delete "/recipes/:id" do
    Recipe.destroy(params[:id].to_i)
    redirect '/recipes'
  end
end
