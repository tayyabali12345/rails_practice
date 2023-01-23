# frozen_string_literal: true

class CreateUserTopics < ActiveRecord::Migration[5.2]
  def change
    create_table :user_topics, &:timestamps
  end
end
