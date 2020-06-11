# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Movie, type: :model do
  subject do
    described_class.new(title: 'Avengers',
                        description: 'Adapted from Marvel Comics',
                        year: 2012,
                        length: '2h 24m',
                        rating: 'PG-13',
                        image: File.new(Rails.root + 'spec/fixtures/images/rails.jpg'))
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:year) }
    it { should validate_presence_of(:length) }
    it { should validate_presence_of(:rating) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an description' do
      subject.description = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a year' do
      subject.year = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an length' do
      subject.length = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an rating' do
      subject.rating = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it { should have_many(:reviews) }
  end
end
