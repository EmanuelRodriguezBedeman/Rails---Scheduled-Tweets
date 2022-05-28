class CreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users do |t|
      t.string :email, null: false # the last parameter stops empty emails to show up
      t.string :password_digest

      t.timestamps
    end
  end
end
