require './config/environment'
class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#Index Action
  get '/' do
    binding.pry
    @recipes = Recipes.all
    erb :index
  end
#Create Action
  get '/new' do

    erb :new
  end

  post '/recipes/new'do
    @recipe = Recipes.create(:name => params[:name], :ingredients => params[:ingredients], :cook_time => params[:cook_time] )
    redirect to "/#{@recipe.id}"
  end
#Show Action
  get '/:id' do
    erb :recipes
  end

end
