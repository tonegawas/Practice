class Item < ApplicationRecord
    belongs_to :genre
    has_many :cart_items, dependent: :destroy
    has_many :order_details, dependent: :destroy
    attachment :image 
    
    def self.search(search)
        
      if search 
        Item.where(['name LIKE ?', "%#{search}%"])
      else
        Item.all
      end
    end
end
