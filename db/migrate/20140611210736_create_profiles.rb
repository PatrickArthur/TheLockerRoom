class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :sport
      t.string :team
      t.string :position
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
      t.integer :bmi
      t.integer :bodyfat
      t.integer :wilkes
      t.integer :speed
      t.integer :neck
      t.integer :hip
      t.integer :bench
      t.integer :squat
      t.integer :deadlift
      t.integer :powerclean
      t.integer :cleanpress
      t.string :description
      t.timestamps
    end
  end
end
