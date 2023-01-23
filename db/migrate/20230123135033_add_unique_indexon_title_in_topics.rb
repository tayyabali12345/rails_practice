class AddUniqueIndexonTitleInTopics < ActiveRecord::Migration[5.2]
  def change
    add_index :topics, :title, unique: true
  end
end
