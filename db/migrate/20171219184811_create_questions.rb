class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :yes
      t.integer :no
      t.integer :unsure
      t.string :comments
      t.integer :user_id
      t.string :sex
      t.integer :age

      t.timestamps
    end
  end
end
