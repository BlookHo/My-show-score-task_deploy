module Api
  module V1
    class ReviewsController < ApplicationController
      # caches_action :reviews_list, :expires_in => 1.minute

      def reviews_list
        sleep(1.5)
        Rails.cache.fetch("reviews_list", expires_in: 10.seconds) do
          shows = pages_of(Show.top_scores.as_json, 10)
          respond_to do |format|
            if shows.blank?
              format.html {  render nothing: true, status: :unprocessable_entity }
              format.json {}
            else
              format.json { render json:  { shows: shows,
                                            status: :successfully,
                                            notice: 'Shows list successfully fetched'}
              }
            end
          end
        end
      end
    end
  end
end
