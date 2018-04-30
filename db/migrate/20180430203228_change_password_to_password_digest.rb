class ChangePasswordToPasswordDigest < ActiveRecord::Migration[5.2]
  def change
  	remove_column :donors, :password, :string
  	add_column :donors, :password_digest, :string
  end
end
