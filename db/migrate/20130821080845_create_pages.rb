class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.boolean :is_front_page

      t.timestamps
    end
  end
end
