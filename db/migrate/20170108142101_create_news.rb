class CreateNews < ActiveRecord::Migration[5.0]
  def change
    create_table :news do |t|
      t.string :publisher
      t.string :content

      t.timestamps
    end
  end
end
