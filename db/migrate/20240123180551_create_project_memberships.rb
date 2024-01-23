class CreateProjectMemberships < ActiveRecord::Migration[6.1]
  def change
    create_table :project_memberships do |t|
      t.belongs_to :user, index: true
      t.belongs_to :project, index: true
      t.timestamps
    end

    add_index :project_memberships, [:user_id, :project_id], unique: true
  end
end
