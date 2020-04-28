class CreateBikes < ActiveRecord::Migration[6.0]
  def change
    create_table :bikes do |t|
      t.text :title
      t.text :description
      t.string :image
      t.references :zipcode, null: false, foreign_key: true

      t.timestamps
    end
  end
end
