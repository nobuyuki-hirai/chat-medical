class AddOrganizerIdEvents < ActiveRecord::Migration[6.0]
  def change
    add_reference :events, :organizer, foreign_key: { to_table: :users }
  end
end
