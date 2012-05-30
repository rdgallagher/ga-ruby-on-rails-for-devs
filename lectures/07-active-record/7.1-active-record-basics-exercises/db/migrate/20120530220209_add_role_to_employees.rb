class AddRoleToEmployees < ActiveRecord::Migration
  def change
    change_table(:employees) do |t|
      t.references :role
    end
  end
end
