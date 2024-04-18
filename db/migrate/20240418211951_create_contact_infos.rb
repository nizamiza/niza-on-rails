class CreateContactInfos < ActiveRecord::Migration[7.1]
  def change
    create_table :contact_infos do |t|
      t.string :address, null: true
      t.string :phone, null: true
      t.string :email, null: true
      t.json :social_links, null: true
      t.json :languages, null: true
      t.timestamps
    end
  end
end
