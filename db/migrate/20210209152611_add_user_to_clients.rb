class AddUserToClients < ActiveRecord::Migration[6.0]
  def change
    add_reference :clients, :user, foregin_key: true
  end
end
