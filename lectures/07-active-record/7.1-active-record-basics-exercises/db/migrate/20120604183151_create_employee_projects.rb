class CreateEmployeeProjects < ActiveRecord::Migration
  def change
    create_table :employee_projects do |t|
      t.references :employee, :project

      t.timestamps
    end

    add_index :employee_projects, :employee_id
    add_index :employee_projects, :project_id
    add_index :employee_projects, [:employee_id, :project_id], unique: true
  end
end
