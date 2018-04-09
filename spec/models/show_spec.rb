require 'rails_helper'

describe Show, type: :model do
  before do
    5.times { FactoryBot.create(:show) }
    described_class.create(title: 'Show with maximum score',
                           description: Faker::Lorem.paragraph,
                           ave_score: 200,
                           review_count: Faker::Number.number(4))
  end

  describe '#top_scores' do
    let(:top_score_list) { described_class.top_scores }
    context 'when shows reviews list is not empty' do
      it 'and have a proper count' do
        expect(described_class.top_scores.count).to eq(6)
      end
      context 'show in the first row' do
        it 'has maximum score' do
          expect(top_score_list.first.title).to eq('Show with maximum score')
        end
      end
    end
  end
end
