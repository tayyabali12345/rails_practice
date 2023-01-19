class UpdateLikesDefaultInQuestion < ActiveRecord::Migration[5.2]
  def change
    change_column_default :questions, :likes, from: nil, to: 0
    change_column_default :questions, :dislikes, from: nil, to: 0
  end
end
