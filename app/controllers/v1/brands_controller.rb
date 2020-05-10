class V1::BrandsController < ApplicationController
  
  def index
    @brands = Brand.all
    render json: {status: 'SUCCESS', message: 'Loaded brands', data:@brands} , status: :ok
  end

  def show
    @brand = Brand.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded brand', data:@brand} , status: :ok

  end
  
  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      render json: {status: 'SUCCESS', message: 'brand saved', data:@brand} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@brand.errors} , status: :unprocessable_entity
    end
  end

  def destroy
    @brand = Brand.where(id: params[:id]).first
    @brand.destroy
    render json: {status: 'SUCCESS', message: 'brand deleted', data:@brand} , status: :ok
  end
   
  def update 
    # puts "***************************************"
    # puts params[:random]
    @brand = Brand.where(id: params[:id]).first
    if @brand.update_attributes(brand_params)
      render json: {status: 'SUCCESS', message: 'brand updated', data:@brand} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@brand.errors} , status: :unprocessable_entity
    end
  
  
  end


  private

  def brand_params 
    params.require(:brand).permit(:brand_name)
  end
end
