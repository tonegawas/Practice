class Public::EndUsersController < ApplicationController
    def show
        @user = EndUser.find(current_end_user.id)

    end
    
    def edit
        @user = EndUser.find(current_end_user.id)
    end
    
    def update
        @user = EndUser.find(current_end_user.id)
        @user.update(end_user_params)
        redirect_to end_users_mypage_path
    end
    
    def confirm
    end
    
    def unsubscribe
        @user = EndUser.find(current_end_user.id)
        @user.update(is_unsubscribed: true)
        reset_session
        redirect_to root_path
    end
    
    private
    
    def end_user_params
        params.require(:end_user).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :phone_number, :email)
    end
end
