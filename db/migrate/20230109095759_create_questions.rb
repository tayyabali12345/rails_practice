class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.string :subject
      t.string :description
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
