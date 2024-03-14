class RefactorProlects < ActiveRecord::Migration[6.1]
  def change
    rename_column :projects, :user_id, :owner_id
    add_column :projects, :status, :string
  end
end
