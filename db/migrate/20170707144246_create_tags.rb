class CreateTags < ActiveRecord::Migration[5.1]
  using(:tags)

  def change
    create_table :tags do |t|
      t.string :name

      t.timestamps
    end
  end
end
