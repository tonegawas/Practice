class ChangeIsUnsubscribedOfEndUsers < ActiveRecord::Migration[5.2]
  def up
    change_column :end_users, :is_unsubscribed, :boolean, default: false
  end
  
  def down
   change_column :end_users, :is_unsubscribed, :boolean
  end
end
