class CreateVideos < ActiveRecord::Migration[6.0]
  def change
    create_table :videos do |t|
      t.text :external_id
      t.text :title
      t.text :description
      t.text :thumbnail_url
      t.references :channel, foreign_key: true
      t.timestamps
    end
  end
end
