class Show < ActiveRecord::Base
  has_many :reviews

  # TODO delete '.order(ave_score: :desc)' from this scope. This is left here from Step 1 - just to show
  scope :top_scores, -> { all.order(ave_score: :desc).sort_by(&:random_score).reverse }

  # Step 2
  def random_score
    ave_score + rand(100)
  end
end
