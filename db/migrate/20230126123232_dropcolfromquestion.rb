class Dropcolfromquestion < ActiveRecord::Migration[5.2]
  def change
    remove_column :questions, :likes, :integer
    remove_column :questions, :dislikes, :integer
  end
end
