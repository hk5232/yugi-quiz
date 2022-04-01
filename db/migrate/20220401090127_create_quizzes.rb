class CreateQuizzes < ActiveRecord::Migration[6.0]
  def change
    create_table :quizzes do |t|
      t.text   :question, null: false
      t.string   :card_name, null: false
      t.integer   :attack
      t.integer   :defense
      t.integer   :source_id, null: false
      t.timestamps
    end
  end
end
