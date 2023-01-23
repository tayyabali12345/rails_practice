class AddingdefaulttoAgeinUsers < ActiveRecord::Migration[5.2]
  def change
    change_column :users, :age, :integer, :default => 18, :min => 18, :max => 100
  end
end
