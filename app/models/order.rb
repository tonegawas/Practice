class Order < ApplicationRecord
    belongs_to :end_user
    
    has_many :order_details, dependent: :destroy
    
    enum status:{
        p_wait: 0, 
        p_done: 1,
        making: 2,
        s_wait: 3, 
        s_done: 4
    }
    
    enum payment_method:{
        credit: 0,
        bank: 1,
    }

end
