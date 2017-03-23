class CategoriesController < ApplicationController
		#check user is admin
	def new
		@category = Category.new
	end

	def create 
		@category = Category.new(category_params)
		if @category.save
			flash[:notice] = "Category was successfully created."
			redirect_to categories_path
		else
			flash[:alert] = "Can not create new category. Please try again later."
			render 'new'
		end
	end

	def index
		@categories = Category.all
	end

	def edit
		@category = Category.find(params[:id])
	end

	def update
		@category = Category.find(params[:id])
		if @category.update(category_params)
			flash[:notice] = "Updated category successfully."
			redirect_to category_path(@category.id)
		else
			render 'edit'
		end
	end

	def show
		@category = Category.find(params[:id])
	end

	def destroy
		@category = Category.find(params[:id])
		@category.destroy
	end
	private 
	def category_params
		params.require(:category).permit(:name, :description)
	end
end