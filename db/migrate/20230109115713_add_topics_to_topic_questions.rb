# frozen_string_literal: true

class AddTopicsToTopicQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :topic_questions, :topic, foreign_key: true
  end
end
