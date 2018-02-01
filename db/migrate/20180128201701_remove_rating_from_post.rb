class RemoveRatingFromPost < ActiveRecord::Migration[5.0]
  def change
    remove_column :posts, :rating
  end
end
