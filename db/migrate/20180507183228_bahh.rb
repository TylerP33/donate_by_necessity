class Bahh < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :recipient_id, :integer
  end
end
