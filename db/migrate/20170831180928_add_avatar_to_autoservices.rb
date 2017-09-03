class AddAvatarToAutoservices < ActiveRecord::Migration[5.1]
  def change
    add_column :autoservices, :avatar, :string
  end
end
