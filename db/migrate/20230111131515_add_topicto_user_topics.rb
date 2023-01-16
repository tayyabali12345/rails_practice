class AddTopictoUserTopics < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_topics, :topic, foreign_key: true
  end
end
