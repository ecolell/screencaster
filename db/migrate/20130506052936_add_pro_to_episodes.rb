class AddProToEpisodes < ActiveRecord::Migration[5.0]
  using(:episodes)
  
  def change
    add_column :episodes, :pro, :boolean, default: false, null: false
  end
end
