class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :commentforbook

      t.references :book
      t.timestamps
    end
  end
end
