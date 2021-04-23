class CreateTasks < ActiveRecord::Migration[5.1]
  def change
    create_table :tasks do |t|
      t.string :title
      t.text :content
      t.date :start_date
      t.date :finish_date
      t.boolean :all_date

      t.timestamps
    end
    add_index :tasks, :title
  end
end
