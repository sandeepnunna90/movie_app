# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  subject do
    described_class.new(email: 'john@doe.com',
                        password: 'some_password',
                        admin: false)
  end

  describe 'Validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an email' do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without an admin value' do
      subject.admin = nil
      expect(subject).to_not be_valid
    end

    it 'admin should be a boolean value' do
      expect(subject.admin).to be_in([true, false])
    end
  end
end
