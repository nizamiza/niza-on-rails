class CreateAccessRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :access_requests do |t|
      t.integer :kind
      t.string :name
      t.string :email
      t.string :message, null: true
      t.string :approval_token
      t.belongs_to :access_token, null: true, foreign_key: true

      t.timestamps
      t.index :approval_token, unique: true
    end
  end
end
