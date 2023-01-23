# frozen_string_literal: true

class UpdateLikesDefaultInAnswer < ActiveRecord::Migration[5.2]
  def change
    change_column_default :answers, :likes, from: nil, to: 0
    change_column_default :answers, :dislikes, from: nil, to: 0
  end
end
