class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.text :name
      t.integer :priority
      t.datetime :start_date
      t.datetime :end_date
      t.integer :status
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
