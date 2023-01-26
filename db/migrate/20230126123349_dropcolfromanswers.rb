class Dropcolfromanswers < ActiveRecord::Migration[5.2]
  def change
    remove_column :answers, :dislikes, :integer
    remove_column :answers, :likes, :integer
  end
end
