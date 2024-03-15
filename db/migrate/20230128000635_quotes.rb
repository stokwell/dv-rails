class Quotes < ActiveRecord::Migration[7.0]
  def change
    create_table :quotes do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.string :source
      t.string :author, default: 'unknown'
      t.timestamps
    end
  end
end