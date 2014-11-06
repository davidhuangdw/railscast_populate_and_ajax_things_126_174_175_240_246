class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :company
      t.string :phone
      t.string :country
      t.string :state
      t.string :city
      t.string :zip
      t.string :street
      t.string :email

      t.timestamps
    end
  end
end
