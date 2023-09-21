require 'rails_helper'

RSpec.describe Auction, type: :model do

  seller = User.new(email: "seller@email.com", password: "12345")

  subject { described_class.new(title: "Title", description: "Short description", start_date: DateTime.now, end_date: DateTime.now + 1.week, user_id: seller) }

  it "is valid with valid attributes" do
    expect(subject).to be_valid
  end

  it "is not valid without a title" do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a description" do
    subject.description = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a start_date" do
    subject.start_date = nil
    expect(subject).to_not be_valid
  end

  it "is not valid without a end_date" do
    subject.end_date = nil
    expect(subject).to_not be_valid
  end
end
