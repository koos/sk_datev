class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :sk_user_id
      t.string :sk_company_id
      t.string :sk_access_token
      t.string :name
      t.timestamps
    end
  end
end
