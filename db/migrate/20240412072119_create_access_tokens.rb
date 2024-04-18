class CreateAccessTokens < ActiveRecord::Migration[7.1]
  def change
    create_table :access_tokens do |t|
      t.string :token
      t.datetime :expires_at
      t.integer :type

      t.timestamps
    end
  end
end
