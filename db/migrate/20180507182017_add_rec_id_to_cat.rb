class AddRecIdToCat < ActiveRecord::Migration[5.2]
  def change
  	add_column :categories, :recipient_id, :integer
  end
end
