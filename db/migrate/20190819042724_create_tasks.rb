class CreateTasks < ActiveRecord::Migration[5.2]
  def change
    create_table :tasks do |t|
      t.string :name
      t.text :content
      # t.string :image
      t.date :due_date_at
      t.integer :assignee_id
      t.integer :user_id
      # t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
