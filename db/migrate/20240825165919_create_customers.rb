class CreateCustomers < ActiveRecord::Migration[7.2]
  def change
    create_table :customers do |t|
      t.string :name
      t.string :telephone
      t.string :nickname
      t.integer :cpf
      t.date :birthday

      t.timestamps
    end
  end
end
