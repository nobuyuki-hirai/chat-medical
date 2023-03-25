class AddCreatorIdRooms < ActiveRecord::Migration[6.0]
  def change
    add_reference :rooms, :creator, foreign_key: { to_table: :users }
  end
end
