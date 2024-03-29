# spec/models/user_spec.rb
require 'rails_helper'

RSpec.describe User, type: :model do
  subject{ described_class.new(password: 'password', email: 'email') }

  describe "validations" do

    it "is valid with valid attributes" do
      expect(subject).to be_valid
    end

    it "is not valid without email" do
      subject.email = nil
      expect(subject).to_not be_valid
    end

    it "is not valid without password" do
      subject.password = nil
      expect(subject).to_not be_valid
    end

  end

end

