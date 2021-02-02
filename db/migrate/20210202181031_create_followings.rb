class CreateFollowings < ActiveRecord::Migration[6.1]
  def change
    create_table :followings do |t|
      t.belongs_to :follower
      t.belongs_to :followed
      t.timestamps
    end
  end
end
