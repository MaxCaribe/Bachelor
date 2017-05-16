class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts, id: false do |t|
      t.integer :user_id
      t.integer :contact_id
    end
    add_index(:contacts, [:user_id, :contact_id], :unique => true)
    add_index(:contacts, [:contact_id, :user_id], :unique => true)
  end
end
