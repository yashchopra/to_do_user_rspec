require 'rails_helper'

RSpec.describe Task, type: :model do
  it "has a valid factory" do
    expect(build(:task)).to be_valid
  end

  it 'is valid with valid attributes' do
    task = create(:vote)
    task = create(:vote)
    expect(task).to be_valid
  end

  it 'is invalid without name' do
    task = build(:task, name: nil)
    expect(task).not_to be_valid
  end

  it 'is invalid without priority' do
    task = build(:task, priority: nil)
    expect(task).not_to be_valid
  end

  it 'belongs to user' do
    expect(Task.reflect_on_association(:user).macro).to eq(:belongs_to)
  end

end
