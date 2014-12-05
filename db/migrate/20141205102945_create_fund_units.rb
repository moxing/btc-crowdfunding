class CreateFundUnits < ActiveRecord::Migration
  def change
    create_table :fund_units do |t|
      t.decimal :unit
      t.integer :people
      t.references :project, index: true

      t.timestamps
    end
  end
end
