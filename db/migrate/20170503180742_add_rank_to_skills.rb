class AddRankToSkills < ActiveRecord::Migration[5.0]
  def change
    add_column :skills, :rank, :text
  end
end
