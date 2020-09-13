class CreateOrganisations < ActiveRecord::Migration[6.0]
  def change
    create_table :organisations do |t|
      t.text :name
      t.text :slug
      t.timestamps
    end
  end
end
