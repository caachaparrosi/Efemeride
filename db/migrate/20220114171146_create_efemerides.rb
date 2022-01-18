class CreateEfemerides < ActiveRecord::Migration[7.0]
  def change
    create_table :efemerides do |t|
      t.datetime :date
      t.string :categories
      t.text :comments
      t.string :photo

      t.timestamps
    end
  end
end
