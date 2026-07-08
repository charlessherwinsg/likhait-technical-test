require 'rails_helper'

RSpec.describe Expense, type: :model do
  let(:category) { Category.create!(name: "Food") }

  it "is valid with a positive amount and a description" do
    expense = Expense.new(description: "Lunch", amount: 10.0, category: category, date: Date.today)
    expect(expense).to be_valid
  end

  it "is invalid with a non-positive amount" do
    expense = Expense.new(description: "Lunch", amount: 0, category: category, date: Date.today)
    expect(expense).not_to be_valid
  end

  it "is invalid without a description" do
    expense = Expense.new(description: "", amount: 10.0, category: category, date: Date.today)
    expect(expense).not_to be_valid
  end
end
