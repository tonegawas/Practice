class Public::CartItemsController < ApplicationController
    
    def index
        @cart_items = CartItem.where(end_user_id: current_end_user.id)
    end
    
    def create
        cart_item = CartItem.new(cart_item_params)
        cart_item.end_user_id = current_end_user.id
        if current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id]).present?
            cart_item_exist = current_end_user.cart_items.find_by(item_id: params[:cart_item][:item_id])
            cart_item_exist.amount = cart_item_exist.amount + cart_item.amount
            cart_item_exist.save
        else
            cart_item.save
        end
        redirect_to cart_items_path
    end
    
    def update
        cart_item = CartItem.find(params[:id])
        cart_item.update(cart_item_params)
        redirect_to cart_items_path
    end
    
    def destroy
        cart_item = CartItem.find(params[:id])
        cart_item.destroy
        redirect_to cart_items_path
    end
    
    def destroy_all
        cart_items = CartItem.where(end_user_id: current_end_user.id)
        cart_items.destroy_all
        redirect_to cart_items_path
    end
    
    private 
    
    def cart_item_params
        params.require(:cart_item).permit(:item_id, :amount)
    end
    
end
