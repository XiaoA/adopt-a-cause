class CreateProjects < ActiveRecord::Migration
  def change
    create_table :projects do |t|
      t.string :project_name, :project_description, :project_contact_person, :begin_date, :end_date
      t.timestamps
    end
  end
end
