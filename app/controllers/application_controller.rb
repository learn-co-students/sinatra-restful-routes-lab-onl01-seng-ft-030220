require 'pry'
class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  # code actions here!

# 1.	Create a new table in the database to store the recipes. Recipes should have a name, 
# ingredients (which can be written as one string containing all the ingredients), and 
# cook_time.
#	rake db:create_migration NAME=create_recipes
# rake db:migrate SINATRA_ENV=test
# rake db:migrate 
# 2.	Make sure you have a corresponding model for your recipes.

# 6.	Create a controller action (index action) that displays all the recipes in the database.
# http:index page to display all recipes
  get '/recipes' do
      @recipes = Recipe.all
      # @recipe = Recipe.find(params[:id]) 
      erb :index
  end

# 3.	In the application_controller.rb, set up a controller action that will render a form 
# to create a new recipe. This controller action should create and save this new recipe to 
# the database.

# http:displays create recipe form
  get '/recipes/new' do
    
      erb :new
  end

# http:creates one recipe
  post '/recipes' do
      @recipe = Recipe.create(params)
      # if @recipe.persisted?
      redirect "/recipes/#{@recipe.id}"
      # end
  end


# 4.	Again in the application_controller.rb, create a controller action that uses RESTful 
# routes to display a single recipe.

# http:displays one recipe based on ID in the url
  get '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id]) 


    erb :'/show'
  end


# 5.	Create a third controller action that uses RESTful routes and renders a form to edit 
# a single recipe. This controller action should update the entry in the database with the 
# changes, and then redirect to the recipe show page.

# <%# #needs to make a form with all the info from
#the recipe we want to update %>
# <%# this method is posting even though we are patching - so we're spoofing%> %>
# ^this came from the edit.erb file because it caused an error ^
# http:displays edit form based on ID in the url
  get '/recipes/:id/edit' do
    @recipe = Recipe.find_by_id(params[:id]) 

    erb :edit
  end

# 7.	Add to the recipe show page a form that allows a user to delete a recipe. This form 
# should submit to a controller action that deletes the entry from the database and redirects 
# to the index page.
# http:modifies an existing article based on ID in the url
  patch '/recipes/:id' do
    @recipe = Recipe.find(params[:id]) 
    @recipe.update(params[:recipe])

    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipes = Recipe.find(params[:id])
    @recipes.destroy

    redirect "/recipes/index"
  end


end
