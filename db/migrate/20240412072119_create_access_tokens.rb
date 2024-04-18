class CreateAccessTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :access_tokens do |t|
      t.integer :kind
      t.string :token
      t.datetime :expires_at

      t.timestamps
      t.index :token, unique: true
    end
  end
end
