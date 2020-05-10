class V1::CategoriesController < ApplicationController
  def index
    @categories = Category.all
    render json: {status: 'SUCCESS', message: 'Loaded categories', data:@categories} , status: :ok
  end

  def show
    @category = Category.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded category', data:@category} , status: :ok

  end
  
  def create
    @category = Category.new(category_params)
    if @category.save
      render json: {status: 'SUCCESS', message: 'Category saved', data:@category} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@category.errors} , status: :unprocessable_entity
    end
  end

  def destroy
    @category = Category.where(id: params[:id]).first
    @category.destroy
    render json: {status: 'SUCCESS', message: 'Category deleted', data:@category} , status: :ok
  end
   
  def update 
    @category = Category.where(id: params[:id]).first
    if @category.update_attributes(category_params)
      render json: {status: 'SUCCESS', message: 'Category updated', data:@category} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@category.errors} , status: :unprocessable_entity
    end
  
  
  end





  private

  def category_params 
    params.require(:category).permit(:category_name)
  end
end
