class CreateTalks < ActiveRecord::Migration[6.0]
  def change
    create_table :talks do |t|
      t.string         :talk
      t.boolean        :read
      t.references     :sender,    null: false, foreign_key: { to_table: :users }
      t.references     :recipient, null: false, foreign_key: { to_table: :users }
      t.timestamps
    end
  end
end
