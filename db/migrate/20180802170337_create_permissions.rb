class CreatePermissions < ActiveRecord::Migration[5.2]
  def change
    create_table :permissions do |t|
      t.integer :permittee_id
      t.integer :permitter_id

      t.timestamps
    end
  end
end
