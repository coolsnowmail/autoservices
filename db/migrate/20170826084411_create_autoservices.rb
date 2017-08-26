class CreateAutoservices < ActiveRecord::Migration[5.1]
  def change
    create_table :autoservices do |t|
      t.string :name
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
