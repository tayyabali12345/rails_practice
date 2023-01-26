class CreateApprovals < ActiveRecord::Migration[5.2]
  def change
    create_table :approvals do |t|
      t.references :approvable, polymorphic: true

      t.timestamps
    end
  end
end
