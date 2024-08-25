class CreateAddresses < ActiveRecord::Migration[7.2]
  def change
    create_table :addresses do |t|
      t.string :cep
      t.string :street
      t.string :number
      t.string :neighborhood
      t.string :complement
      t.string :city
      t.string :state
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
  end
end
