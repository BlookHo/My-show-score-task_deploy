class AddColumnsToShowsAveScoreReviewCount < ActiveRecord::Migration
  def change
    add_column :shows, :ave_score, :float, default: 0.0
    add_column :shows, :review_count, :integer, default: 0
  end
end
