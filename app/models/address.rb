class Address < ApplicationRecord
    belongs_to :end_user
    
    def display_address
        '〒'  + self.postal_code + ' ' + self.address + ' ' + self.name
    end
end
