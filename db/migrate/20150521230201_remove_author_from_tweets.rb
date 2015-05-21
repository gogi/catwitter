class RemoveAuthorFromTweets < ActiveRecord::Migration
  def change
    remove_column :tweets, :author, :string
  end
end
