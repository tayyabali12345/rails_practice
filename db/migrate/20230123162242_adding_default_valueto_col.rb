class AddingDefaultValuetoCol < ActiveRecord::Migration[5.2]
  def change
    change_column :answers, :description, :string, :default => ""
    change_column :questions, :description, :string, :default => ""
    change_column :questions, :subject, :string, :default => ""
    change_column :topics, :description, :string, :default => ""
    change_column :topics, :title, :string, :default => ""
    

  end
end
