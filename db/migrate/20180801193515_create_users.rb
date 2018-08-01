class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :description
      t.boolean :viewable
      t.integer :location_id
      t.string :age
      t.string :gender

      t.timestamps
    end
  end
end
