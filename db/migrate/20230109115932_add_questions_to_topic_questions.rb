class AddQuestionsToTopicQuestions < ActiveRecord::Migration[5.2]
  def change
    add_reference :topic_questions, :question, foreign_key: true
  end
end
