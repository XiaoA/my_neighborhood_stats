require 'rails_helper'

RSpec.describe User, type: :model do
  it "requires a first name" do
    sherlock = User.new(first_name: nil, last_name: 'Holmes', email: 'sherlock@example.com', password: 'elementary')

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:first_name].any?).to be_truthy
  end
  
  it "requires a last name" do 
    sherlock = User.new(first_name: 'Sherlock', last_name: nil, email: 'sherlock@example.com', password: 'elementary')

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:last_name].any?).to be_truthy
  end
  
  it "requires an email address" do
    sherlock = User.new(first_name: 'Sherlock', last_name: 'Holmes', email: nil, password: 'elementary')

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:email].any?).to be_truthy
  end
  
  it "requires a password" do
    sherlock = User.new(first_name: 'Sherlock', last_name: 'Holmes', email: 'sherlock@example.com', password: nil)

    expect(sherlock).not_to be_valid
    expect(sherlock.errors[:password].any?).to be_truthy
  end
end
