class RemoveUrgentNeedsColumn < ActiveRecord::Migration[5.2]
  def change
  	remove_column :recipients, :urgent_needs, :string
  end
end
