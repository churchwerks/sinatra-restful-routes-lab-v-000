class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
#Index
  get '/recipes' do
    @recipes = Recipe.all
    if @recipes
      erb :recipes
    else
      erb :new
    end
  end
#Create Recipe
  get '/new' do
    erb :new
  end

  post '/new' do
    @recipe = Recipe.new(:name => params["name"], :ingredients => params["ingredients"], :cook_time => params["cook_time"])
    @recipe.save

    binding.pry
    redirect "/show/id}"
  end
#Show Recipe
  get '/show/:id' do
    @recipe = Recipe.find(params["id"])
    if @recipe
      erb :show
    else
      redirect '/recipes'
    end
  end


end
