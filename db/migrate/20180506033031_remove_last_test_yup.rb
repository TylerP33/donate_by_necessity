class RemoveLastTestYup < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :donor_id, :integer
  end
end
