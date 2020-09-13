class CreateChannels < ActiveRecord::Migration[6.0]
  def change
    create_table :channels do |t|
      t.text :name
      t.text :description
      t.text :slug
      t.timestamps
    end
  end
end
