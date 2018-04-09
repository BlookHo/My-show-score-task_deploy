class ShowsController < ApplicationController
  def index
    @shows = pages_of(Show.top_scores.as_json, 10)
  end
end
