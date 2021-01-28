class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.text :username
      t.text :fullname
      t.text :email
      t.text :photo
      t.text :cover_img

      t.timestamps
    end
  end
end
