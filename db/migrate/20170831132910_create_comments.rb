class CreateComments < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :mail
      t.text :text
      t.belongs_to :autoservice, index: true

      t.timestamps
    end
  end
end
