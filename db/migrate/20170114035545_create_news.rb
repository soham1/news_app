class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :title
      t.text :text
      t.text :summary
      t.date :date
      t.boolean :online

      t.timestamps
    end
  end
end
