class CreateSites < ActiveRecord::Migration[6.0]
  def change
    create_table :sites do |t|
      t.text :name
      t.text :description
      t.text :slug
      t.references :organisation, null: false, foreign_key: true
      t.timestamps
    end
  end
end
