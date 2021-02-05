class CreateRolePermissions < ActiveRecord::Migration[6.0]
  def change
    create_table :role_permissions do |t|
      t.references :role, null: false, foreign_key: true
      t.string :permission

      t.timestamps
    end
  end
end
