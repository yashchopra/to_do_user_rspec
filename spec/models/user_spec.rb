require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) {build(:user)}

  it "is invalid without first name" do
    user.firstname = nil
    expect(user).to_not be_valid
  end
  it "is invalid without last name" do
    user.lastname = nil
    expect(user).not_to be_valid
  end
  it "is invalid without email name" do
    user.email = nil
    expect(user).to_not be_valid
  end
  it "is invalid without unique emails" do
    user.save
    user_2 = build(:user, email: user.email)
    expect(user_2).to_not be_valid
  end

  it "has 2 tasks" do
    expect(user.tasks.length).to eq 2
  end
end
