class CreateMessage < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.string :text

      t.belongs_to :user
      t.belongs_to :conversation

      t.timestamps
    end
  end
end
