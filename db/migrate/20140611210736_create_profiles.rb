class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :sport
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :zip
      t.string :phone
      t.string :email
      t.string :gender
      t.integer :age
      t.integer :weight
      t.integer :height
      t.integer :waist
      t.integer :neck
      t.integer :hip
      t.string :description
      t.timestamps
    end
  end
end
