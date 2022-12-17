class Public::ItemsController < ApplicationController
    
    def index
        if params[:genre_id].present?
            @items = Item.where(genre_id: params[:genre_id])
            @title = params[:genre_name].to_s
        else
            @items = Item.all
            @title = "商品一覧"
        end
        @genres = Genre.all
    end 
    
    def show
        @item = Item.find(params[:id])
        @cart_item = CartItem.new
    end
    
end
