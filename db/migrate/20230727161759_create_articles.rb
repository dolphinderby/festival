class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|

      t.string :name, null: false
      t.string :sub_title, null: false
      t.text :introduction, null: false
      t.string :prefecture, null: false
      t.string :venue, null: false
      t.string :event_date, null: false
      t.boolean :is_deleted, default: false, null: false

      t.timestamps
    end
  end
end
