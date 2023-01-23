# frozen_string_literal: true

class AddUsertoUserTopics < ActiveRecord::Migration[5.2]
  def change
    add_reference :user_topics, :user, foreign_key: true
  end
end
