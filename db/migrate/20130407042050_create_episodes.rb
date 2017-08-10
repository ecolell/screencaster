class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.text :description
      t.integer :seconds
      t.date :published_on

      t.timestamps
    end
  end
end
