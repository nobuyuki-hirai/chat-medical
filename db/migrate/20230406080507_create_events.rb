class CreateEvents < ActiveRecord::Migration[6.0]
  def change
    create_table :events do |t|
      t.string         :name
      t.string         :text
      t.string         :place
      t.datetime       :date_and_time
      t.datetime       :event_finish_time
      t.references     :true
      t.references     :false
      t.timestamps
    end
  end
end
