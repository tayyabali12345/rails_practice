# frozen_string_literal: true

class AddColsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :age, :integer
    add_column :users, :gender, :char, default: 'M'
    add_column :users, :username, :string, default: ''
  end
end
