class V1::ProductsController < ApplicationController
  
  def index
    @products = Product.all
    render json: {status: 'SUCCESS', message: 'Loaded products', data:@products} , status: :ok
  end

  def show
    @product = Product.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded product', data:@product} , status: :ok

  end
  
  def create
    @product = Product.new(brand_params)
    if @product.save
      render json: {status: 'SUCCESS', message: 'product saved', data:@product} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@product.errors} , status: :unprocessable_entity
    end
  end

  def destroy
    @product = Product.where(id: params[:id]).first
    @product.destroy
    render json: {status: 'SUCCESS', message: 'product deleted', data:@product} , status: :ok
  end
   
  def update 
    # puts "***************************************"
    # puts params[:random]
    @product = Product.where(id: params[:id]).first
    if @product.update_attributes(product_params)
      render json: {status: 'SUCCESS', message: 'product updated', data:@product} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save product', data:@product.errors} , status: :unprocessable_entity
    end
  
  
  end


  private

  def product_params 
    params.require(:product).permit(:title)
  end
end
