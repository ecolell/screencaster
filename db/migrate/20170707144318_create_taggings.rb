class CreateTaggings < ActiveRecord::Migration[5.1]
  using(:tags)
  
  def change
    create_table :taggings do |t|
      t.belongs_to :tag, foreign_key: true
      t.belongs_to :episode, foreign_key: true

      t.timestamps
    end
  end
end
