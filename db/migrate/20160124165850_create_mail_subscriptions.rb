class CreateMailSubscriptions < ActiveRecord::Migration
  def change
    create_table :mail_subscriptions do |t|
    	t.string :email
    	t.string :ip_address
    	t.timestamps
    end
  end
end
