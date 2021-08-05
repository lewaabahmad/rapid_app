class CreatePages < ActiveRecord::Migration[6.1]
  def change
    create_table :pages do |t|
      t.string :title
      t.text :description
      t.boolean :is_homepage
      t.boolean :is_dashboard
      t.boolean :requires_authentication
      t.text :header_html
      t.boolean :is_in_nav
      t.text :body_html
      t.string :url

      t.timestamps
    end
  end
end
