class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.references :user, null: false, foreign_key: true, index: true
      t.string :title, null: false, default: ""
      t.string :description, null: false, default: ""
      t.integer :status, null: false
      t.datetime :due_date, null: false

      t.timestamps
    end
  end
end
