# frozen_string_literal: true

class CreateTopicQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_questions, &:timestamps
  end
end
