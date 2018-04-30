class ChangeDiaperToPlural < ActiveRecord::Migration[5.2]
  def change
  	remove_column :categories, :diaper, :string
  	add_column :categories, :diapers, :string
  end
end
