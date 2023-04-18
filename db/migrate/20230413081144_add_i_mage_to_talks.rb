class AddIMageToTalks < ActiveRecord::Migration[6.0]
  def change
    add_column :talks, :image, :string
  end
end
