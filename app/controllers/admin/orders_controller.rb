class Admin::OrdersController < ApplicationController
    
    def index
    end
    
    def show
        @order = Order.find(params[:id])
    end
    
    def update
        order = Order.find(params[:id])
        order.update(order_param)
        
        if order.status == "p_done"
            order.order_details.each do |order_detail|
                order_detail.update(making_status: "m_wait")
            end
        end
        
        
        redirect_to admin_order_path(order.id)
    end
    

    
    
    private
    
    def order_param
        params.require(:order).permit(:status)
    end
    

    
end
