class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.boolean :is_homepage, default: false, null: false
      t.boolean :is_dashboard, default: false, null: false
      t.boolean :requires_authentication, default: false, null: false
      t.text :header_html
      t.boolean :is_in_nav, default: false, null: false
      t.text :body_html
      t.string :url

      t.timestamps
    end
  end
end
