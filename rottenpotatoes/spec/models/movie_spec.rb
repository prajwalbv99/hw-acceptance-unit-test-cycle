require 'rails_helper'

describe Movie do
  describe '.find_same_director' do
    let!(:movie1) { FactoryGirl.create(:movie, title: 'A', director: 'X') }
    let!(:movie2) { FactoryGirl.create(:movie, title: 'B', director: 'X') }
    let!(:movie3) { FactoryGirl.create(:movie, title: "C", director: 'Y') }
    let!(:movie4) { FactoryGirl.create(:movie, title: "D") }

    context 'director exists' do
      it 'finds similar movies correctly' do
        expect(Movie.same_director(movie1.title)).to eql(['A', 'B'])
        expect(Movie.same_director(movie1.title)).to_not include(['C'])
      end
    end

    context 'director does not exist' do
      it 'handles sad path' do
        expect(Movie.same_director(movie4.title)).to eql(nil)
      end
    end
  end

end 