class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      t.string :image
      t.datetime :deadline
      t.integer :assigned_user_id
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
