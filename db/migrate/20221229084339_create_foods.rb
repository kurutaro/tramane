class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.string :address
      t.string :url
      t.string :large_area
      t.string :prefecture
      t.string :middle_area
      t.string :station
      t.string :description
      t.string :genle
      t.string :sub_genle
      t.string :budget
      t.string :open
      t.string :access
      t.string :parking
      t.string :logo
      t.string :photo
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
