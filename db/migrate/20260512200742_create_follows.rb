class CreateFollows < ActiveRecord::Migration[8.1]
  def change
    create_table :follows do |t|
      t.integer :followed_if
      t.integer :followee_id

      t.timestamps
    end
  end
end
