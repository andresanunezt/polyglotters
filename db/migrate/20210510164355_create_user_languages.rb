class CreateUserLanguages < ActiveRecord::Migration[6.1]
  def change
    create_table :user_languages do |t|
      t.text :why_learn
      t.text :goals
      
      
      t.boolean :enjoying
      
      t.integer :time_spent
      
      t.belongs_to :user, null: false, foreign_key: true
      t.belongs_to :language, null: false, foreign_key: true

      t.timestamps
    end
  end
end
