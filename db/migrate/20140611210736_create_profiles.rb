class CreateProfiles < ActiveRecord::Migration
  def change
    create_table :profiles do |t|
      t.string :first_name, null: false
      t.string :last_name, null: false
      t.string :sport, null: false
      t.string :address, null: false
      t.string :city, null: false
      t.string :state, null: false
      t.string :zip, null: false
      t.string :phone, null: false
      t.string :email, null: false
      t.string :gender, null: false
      t.integer :age, null: false
      t.integer :weight, null: false
      t.integer :height, null: false
      t.integer :waist, null: false
      t.integer :neck, null: false
      t.integer :hip, null: false
      t.timestamps
    end
  end
end
