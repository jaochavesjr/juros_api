class CreateSales < ActiveRecord::Migration[7.2]
  def change
    create_table :sales do |t|
      t.float :value
      t.float :fees
      t.date :due_date
      t.references :customer, null: false, foreign_key: true
      t.integer :status

      t.timestamps
    end
  end
end
