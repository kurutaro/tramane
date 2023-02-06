class CreateTravelDatasets < ActiveRecord::Migration[5.2]
  def change
    create_table :travel_datasets do |t|
      t.string :name
      t.text :description
      t.date :start_date
      t.integer :stay_number
      t.text :dataset

      t.timestamps
    end
  end
end
