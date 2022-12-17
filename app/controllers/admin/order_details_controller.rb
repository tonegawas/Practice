class Admin::OrderDetailsController < ApplicationController
    def update
        order_detail = OrderDetail.find(params[:id])
        order_detail.update(product_param)
        order = Order.find(order_detail.order_id)
        flag1 = 0
        flag2 = 0
        
        order.order_details.each do |order_detail|
            if order_detail.making_status == "m_ing"
                flag1 = 1
            end
            
            if order_detail.making_status != "m_done"
                flag2 = 1
            end
        end
        
        if flag1 == 1
            order.update(status: "making")
        end
        
        if flag2 == 0
            order.update(status: "s_wait")
        end
        
        redirect_to admin_order_path(order_detail.order.id)
    end
    
    private
    
    def product_param
        params.require(:order_detail).permit(:making_status)
    end
end
