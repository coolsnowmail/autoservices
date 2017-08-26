class CreateModerators < ActiveRecord::Migration[5.1]
  def change
    create_table :moderators do |t|
      t.string :email
      t.string :password_digest

      t.timestamps
    end
  end
end
