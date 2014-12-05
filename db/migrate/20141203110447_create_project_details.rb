class CreateProjectDetails < ActiveRecord::Migration
  def change
    create_table :project_details do |t|
      t.decimal :amount
      t.integer :people
      t.decimal :min_amount
      t.decimal :raise_amount
      t.datetime :start
      t.datetime :end

      t.timestamps
    end
  end
end
