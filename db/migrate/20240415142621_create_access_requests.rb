class CreateAccessRequests < ActiveRecord::Migration[7.1]
  def change
    create_table :access_requests do |t|
      t.integer :kind
      t.json :requester
      t.belongs_to :access_token, null: true, foreign_key: true

      t.timestamps
    end
  end
end
