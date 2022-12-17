class OrderDetail < ApplicationRecord
    belongs_to :item
    belongs_to :order
    
    enum making_status:{
        m_no: 0, 
        m_wait: 1,
        m_ing: 2, 
        m_done: 3
    }
end
