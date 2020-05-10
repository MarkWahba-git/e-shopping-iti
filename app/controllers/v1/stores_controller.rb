class V1::StoresController < ApplicationController
  def index
    @stores = Store.all
    render json: {status: 'SUCCESS', message: 'Loaded stores', data:@stores} , status: :ok
  end

  def show
    @store = Store.find(params[:id])
    render json: {status: 'SUCCESS', message: 'Loaded store', data:@store} , status: :ok

  end
  
  def create
    @store = Store.new(store_params)
    if @store.save
      render json: {status: 'SUCCESS', message: 'store saved', data:@store} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@store.errors} , status: :unprocessable_entity
    end
  end

  def destroy
    @store = Store.where(id: params[:id]).first
    @store.destroy
    render json: {status: 'SUCCESS', message: 'store deleted', data:@store} , status: :ok
  end
   
  def update 
    @store = Store.where(id: params[:id]).first
    if @store.update_attributes(store_params)
      render json: {status: 'SUCCESS', message: 'store updated', data:@store} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save article', data:@store.errors} , status: :unprocessable_entity
    end
  
  
  end





  private

  def store_params 
    params.require(:store).permit(:store_name, :store_summary, :store_admin)
  end






end
