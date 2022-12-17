class Public::OrdersController < ApplicationController
    
    before_action :check_cart_item, {only: [:new,:confirm,:create]}
    
    def index
        @orders = Order.where(end_user_id: current_end_user.id)
    end
    
    def new
        @order = Order.new
        @user = current_end_user
        @addresses = @user.addresses
    end
    
    def confirm
        @cart_items = CartItem.where(end_user_id: current_end_user.id)
        @order = current_end_user.orders.new
        @order.payment_method = params[:order][:payment_method]
        @order.shipping_cost = 800
        @order.status = 0

        
        if params[:order][:address_option] == "0"
            @order.postal_code = current_end_user.postal_code
            @order.address = current_end_user.address
            @order.name = "#{current_end_user.last_name}#{current_end_user.first_name}"
        
        elsif params[:order][:address_option] == "1"
            @address = Address.find(params[:order][:selected_address])
            @order.postal_code = @address.postal_code
            @order.address = @address.address
            @order.name = @address.name
            
        elsif params[:order][:address_option] == "2"
            address = current_end_user.addresses.new()
            address.postal_code = params[:order][:new_postal_code]
            address.address = params[:order][:new_address]
            address.name = params[:order][:new_name]
            address.save
            
            @order.postal_code = address.postal_code
            @order.address = address.address
            @order.name = address.name
        end
    end
            
    def create
        order = Order.new(order_param)
        order.save
        
        current_end_user.cart_items.each do |cart_item|
            order_detail = OrderDetail.new
            order_detail.order_id = order.id
            order_detail.item_id = cart_item.item_id
            order_detail.amount = cart_item.amount
            order_detail.price = cart_item.item.price
            order_detail.making_status = "m_no"
            order_detail.save
        end
        
        current_end_user.cart_items.destroy_all
        redirect_to orders_done_path
    end
    
    def done
    end
    
    private
    
    def order_param
        params.require(:order).permit(:end_user_id, :postal_code, :address, :name, :shipping_cost, :total_payment, :payment_method, :status)
    end
    
    def check_cart_item
        @cart_items = CartItem.where(end_user_id:[current_end_user.id])
        if @cart_items.blank?
            redirect_to items_path
        end
    end
end
