require 'spec_helper'

describe IndianCurrency do
  it "money is equal to itself" do
    indian_currency = IndianCurrency.new(10,40)
    expect(indian_currency).to eq(indian_currency)
  end

  it "money with equal rupee and paise are equal" do
    indian_currency1 = IndianCurrency.new(10,40)
    indian_currency2 = IndianCurrency.new(10,40)
    expect(indian_currency1).to eq(indian_currency2)
  end

  it "money with different rupee and paise are not equal" do
    indian_currency1 = IndianCurrency.new(10,40)
    indian_currency2 = IndianCurrency.new(10,45)
    expect(indian_currency1).to_not eq(indian_currency2)
  end

  it "money with 5 rupee and 40 paise should return a string 5.40" do
    indian_currency = IndianCurrency.new(5,40)
    expect(indian_currency.to_s).to eq("5.40")
  end
end