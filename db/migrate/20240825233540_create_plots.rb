class CreatePlots < ActiveRecord::Migration[7.2]
  def change
    create_table :plots do |t|
      t.float :value
      t.integer :number
      t.integer :status
      t.date :payment_date
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
