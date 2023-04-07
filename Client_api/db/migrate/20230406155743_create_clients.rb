class CreateClients < ActiveRecord::Migration[7.0]
  def change
    create_table :clients do |t|
      t.string :firstname
      t.string :lastname
      t.string :gender
      t.string :dob
      t.string :digitalAddress
      t.string :state
      t.string :country
      t.string :mobileNumber
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
