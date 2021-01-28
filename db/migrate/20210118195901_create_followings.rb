class CreateFollowings < ActiveRecord::Migration[6.0]
  def change
    create_table :followings do |t|
      t.references :user, foreign_key: true
      t.references :follower, foreign_key: false

      t.timestamps
    end
    add_foreign_key :followings, :users, column: :follower_id
  end
end
