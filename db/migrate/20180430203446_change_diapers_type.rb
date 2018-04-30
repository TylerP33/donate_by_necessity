class ChangeDiapersType < ActiveRecord::Migration[5.2]
  def change
  	  change_column :categories, :diapers, :integer
  end
end
