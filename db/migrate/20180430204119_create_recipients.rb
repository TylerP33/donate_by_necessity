class CreateRecipients < ActiveRecord::Migration[5.2]
  def change
    create_table :recipients do |t|
      t.string :first_name
      t.string :last_name
      t.string :location
      t.string :gender
      t.text :personal_notes
      t.string :urgent_needs
      t.integer :donor_id
      t.integer :category_id

      t.timestamps
    end
  end
end
