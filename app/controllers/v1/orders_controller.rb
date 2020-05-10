class V1::OrdersController < ApplicationController
def index
  @orders = Order.all
  render json: {status: 'SUCCESS', message: 'Loaded orders', data:@orders} , status: :ok
end

def show
  @order = Order.find(params[:id])
  render json: {status: 'SUCCESS', message: 'Loaded order', data:@order} , status: :ok

end

def create
  @order = Order.new(order_params)
  if @order.save
    puts "**********"
          params[:line_items].each do |t|
                puts @order.id
                @line_item = LineItem.new()
                @line_item.order_id=@order.id
                puts t[:product_name]
                @line_item.product_name =  t[:product_name]
                puts t[:product_qty]
                @line_item.product_qty=  t[:product_qty]
                @line_item.save
                
          end
      
  
      # puts "**********"
      #   params[:line_items].each do |t|
      #     puts t[:product_name]
      #     puts t[:product_qty]
      #     puts @line_item.id
      #   end
    render json: {status: 'SUCCESS', message: 'order saved', data:@order} , status: :ok
  else
    render json: {status: 'ERROR', message: 'Cannot save order', data:@order.errors} , status: :unprocessable_entity
  end
end

def destroy
  @order = Order.where(id: params[:id]).first
  @order.destroy
  render json: {status: 'SUCCESS', message: 'order deleted', data:@order} , status: :ok
end
 
def update 
  @order = Order.where(id: params[:id]).first
  if @order.update_attributes(order_params)
    render json: {status: 'SUCCESS', message: 'order updated', data:@order} , status: :ok
  else
    render json: {status: 'ERROR', message: 'Cannot save order', data:@order.errors} , status: :unprocessable_entity
  end


end

private

def order_params 
  params.require(:order).permit(:buyer_id, :order_status, :order_total_price)
end
end
