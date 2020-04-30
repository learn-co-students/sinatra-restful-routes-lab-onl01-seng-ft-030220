#Placeholder for a model
# 2.	Make sure you have a corresponding model for your recipes.
class Recipe < ActiveRecord::Base
    validates_presence_of :name, :ingredients, :cook_time

    
end
