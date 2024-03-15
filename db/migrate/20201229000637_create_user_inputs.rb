class CreateUserInputs < ActiveRecord::Migration[6.0]
  def change
    create_table :user_inputs do |t|
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.string :language
      t.timestamps
    end
  end
end
