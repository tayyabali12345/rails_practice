# frozen_string_literal: true

class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.string :description
      t.integer :likes
      t.integer :dislikes

      t.timestamps
    end
  end
end
