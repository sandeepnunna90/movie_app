# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Review, type: :model do
  let(:avengers) do
    Movie.new(title: 'Avengers',
              description: 'Adapted from Marvel Comics',
              year: 2012,
              length: '2h 24m',
              rating: 'PG-13')
  end

  let(:fanboy) do
    User.new(email: 'john@doe.com',
             password: 'some_password',
             admin: false)
  end

  subject do
    described_class.new(comment: 'Great Movie',
                        score: 9,
                        movie: avengers,
                        user: fanboy)
  end

  describe 'Validations' do
    it { should validate_presence_of(:comment) }
    it { should validate_presence_of(:score) }
    it { should validate_presence_of(:movie) }
    it { should validate_presence_of(:user) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a comment' do
      subject.comment = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an score' do
      subject.score = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a movie' do
      subject.movie = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an user' do
      subject.user = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should belong_to(:user) }
    it { should belong_to(:movie) }
  end
end
