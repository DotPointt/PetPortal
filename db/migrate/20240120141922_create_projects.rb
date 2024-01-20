class CreateProjects < ActiveRecord::Migration[6.1]
  def change
    create_table :projects do |t|
      t.text :title
      t.text :description
      t.integer :user_id

      t.timestamps
    end
  end
end
