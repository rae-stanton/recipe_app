class DashboardController < ApplicationController


	def index
		@recipes = @current_user.recipes

		def users
			@current_user
		end

		def favorite_recipes
			@recipes.favorites
		end
	end

	def show
	end
end
