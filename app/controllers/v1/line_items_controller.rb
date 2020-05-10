class V1::LineItemsController < ApplicationController
  def index
    @line_items = LineItem.where(order_id: params[:order_id])
    render json: {status: 'SUCCESS', message: 'Loaded line_items', data:@line_items} , status: :ok
  end
  
  # def show
  #   @line_item = LineItem.where(order_id: params[:order_id])
  #   render json: {status: 'SUCCESS', message: 'Loaded line_item', data:@line_item} , status: :ok
  
  # end
  
  def create
    @order = Order.find(params[:order_id])
    @line_item = @order.line_items.new(line_item_params)
    if @line_item.save
      render json: {status: 'SUCCESS', message: 'line_item saved', data:@line_item} , status: :ok
    else
      render json: {status: 'ERROR', message: 'Cannot save line_item', data:@line_item.errors} , status: :unprocessable_entity
    end
  end
  
  # def destroy
  #   @order = Order.find(params[:order_id])
  #   @line_item = @order.line_items.find(params[:id])
  #   @line_item.destroy
  #   render json: {status: 'SUCCESS', message: 'line_item deleted', data:@line_item} , status: :ok
  # end
   
  # def update 
  #   @order = Order.find(params[:order_id])
  #   @line_item = @order.line_items.find(params[:id])

  #   if @line_item.update_attributes(line_item_params)
  #     render json: {status: 'SUCCESS', message: 'line_item updated', data:@line_item} , status: :ok
  #   else
  #     render json: {status: 'ERROR', message: 'Cannot save line_item', data:@line_item.errors} , status: :unprocessable_entity
  #   end
  
  # end
  
  private
  
  def line_item_params 
    params.require(:line_item).permit(:order_id, :product_name, :product_qty)
  end
end
