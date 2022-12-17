class Public::AddressesController < ApplicationController
    def index
        @addresses = Address.where(end_user_id: current_end_user.id)
        @new_address = Address.new
    end
    
    def create
        address = Address.new(address_params)
        address.end_user_id = current_end_user.id
        address.save
        redirect_to end_users_mypage_addresses_path
    end
    
    private
    
    def address_params
        params.require(:address).permit(:postal_code, :address, :name)
    end
end
