require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { build(:user) }

  it "shouldn't validate password less then 8 symbols" do
    user.password = "test"

    expect(user.save).to eq(false)
    expect(user.errors[:password].size).to eq(1)
  end

  it "shouldn't be created without unique email" do
    user.save
    user_second = build(:user, email: user.email)

    expect(user_second.save).to eq(false)
    expect(user_second.errors[:email].size).to eq(1)
  end

  it "shouldn't be created with incorrect confirmation" do
    user.password_confirmation = Faker::Internet.password(9)

    expect(user.save).to eq(false)
    expect(user.errors[:password_confirmation].size).to eq(1)
  end

  it "should be created" do
    expect(user.save).to eq(true)
  end
end