class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.integer :toilet_paper
      t.integer :dental_hygiene
      t.integer :first_aid
      t.integer :general_hygiene
      t.integer :diaper
      t.integer :underwear_socks
      t.integer :blankets
      t.integer :school_supplies

      t.timestamps
    end
  end
end
