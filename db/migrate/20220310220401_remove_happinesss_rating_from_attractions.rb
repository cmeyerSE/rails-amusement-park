class RemoveHappinesssRatingFromAttractions < ActiveRecord::Migration[5.2]
  def change
    remove_column :attractions, :happinesss_rating, :integer
  end
end
