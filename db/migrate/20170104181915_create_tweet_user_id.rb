class CreateTweetUserId < ActiveRecord::Migration[5.0]
  def change
    remove_column :tweets, :user_name, :string
    add_column :tweets, :user_id , :integer
  end
end
