class CreateTopicQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :topic_questions do |t|

      t.timestamps
    end
  end
end
