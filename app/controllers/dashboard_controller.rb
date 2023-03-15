class DashboardController < ApplicationController
	def index
		@recipes = @current_user.recipes
	end

	def show
	end
end
