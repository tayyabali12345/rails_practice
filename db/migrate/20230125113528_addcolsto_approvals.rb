class AddcolstoApprovals < ActiveRecord::Migration[5.2]
  def change
    add_reference :approvals, :user, foreign_key: true
    add_column :approvals, :like, :boolean, :default => false
    add_column :approvals, :dislike, :boolean, :default => false
  end
end
