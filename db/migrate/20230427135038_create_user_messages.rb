class CreateUserMessages < ActiveRecord::Migration[6.0]
  def change
    create_table :user_messages do |t|
      t.references     :user,   null: false, foreign_key: true
      t.references     :room,   null: false, foreign_key: true
      t.time           :last_read_at
      t.timestamps
    end
  end
end
