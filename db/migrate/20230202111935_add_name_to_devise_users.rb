class AddNameToDeviseUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :devise_users, :name, :string
  end
end
