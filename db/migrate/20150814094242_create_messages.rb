class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.references :conversation, index: true
      t.references :profile, index: true
      t.boolean :sender_deleted, :receiver_deleted, :default => 0
      t.text :body
      t.datetime :read_at
      t.timestamps
    end
  end
end