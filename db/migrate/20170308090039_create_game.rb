class CreateGame < ActiveRecord::Migration[5.0]
  def change
    create_table :games do |t|
      t.string :name

      t.timestamp
    end
  end
end
