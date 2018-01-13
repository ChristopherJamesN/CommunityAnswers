class CreateQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :questions do |t|
      t.string :content
      t.integer :yes
      t.integer :no
      t.integer :unsure
      t.string :comments
      t.integer :user_id
      t.integer :yes12
      t.integer :yes26
      t.integer :yes45
      t.integer :yes63
      t.integer :yes80
      t.integer :yes_male
      t.integer :yes_female
      t.integer :yes_other
      t.integer :no12
      t.integer :no26
      t.integer :no45
      t.integer :no63
      t.integer :no80
      t.integer :no_male
      t.integer :no_female
      t.integer :no_other
      t.integer :unsure12
      t.integer :unsure26
      t.integer :unsure45
      t.integer :unsure63
      t.integer :unsure80
      t.integer :unsure_male
      t.integer :unsure_female
      t.integer :unsure_other

      t.timestamps
    end
  end
end
