require 'spec_helper'

describe IndianCurrency do
  describe "Equality" do
    it "is equal to itself" do
      indian_currency = IndianCurrency.new(10,40)
      expect(indian_currency).to eq(indian_currency)
    end

    it "with equal rupee and paise are equal" do
      indian_currency1 = IndianCurrency.new(10,40)
      indian_currency2 = IndianCurrency.new(10,40)
      expect(indian_currency1).to eq(indian_currency2)
    end

    it "with different rupee and paise are not equal" do
      indian_currency1 = IndianCurrency.new(10,40)
      indian_currency2 = IndianCurrency.new(10,45)
      expect(indian_currency1).to_not eq(indian_currency2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise" do
      indian_currency1 = IndianCurrency.new(1,40)
      indian_currency2 = IndianCurrency.new(0,140)
      expect(indian_currency1).to eq(indian_currency2)
    end

    it "is not equal to nil money object" do
      indian_currency1 = IndianCurrency.new(10,40)
      indian_currency2 = nil
      expect(indian_currency1).to_not eq(indian_currency2)
    end

    it "is not equal to some object" do
      indian_currency1 = IndianCurrency.new(10,40)
      indian_currency2 = 5
      expect(indian_currency1).to_not eq(indian_currency2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise in terms of hash" do
      indian_currency1 = IndianCurrency.new(1,40)
      indian_currency2 = IndianCurrency.new(0,140)
      expect(indian_currency1.hash).to eq(indian_currency2.hash)
    end
  end

  describe "Summation" do
    it "sum of money with 5 rupees 40 paise and 1 rupee 30 paise should be equal to money with 6 rupees 70 paise" do
      indian_currency1 = IndianCurrency.new(5,40)
      indian_currency2 = IndianCurrency.new(1,30)
      indian_currency3 = IndianCurrency.new(6,70)
      expect(indian_currency1 + indian_currency2).to eq(indian_currency3)
    end

    it "sum of money with 5 rupees 40 paise and 1 rupee 200 paise should be equal to money with 8 rupees 40 paise" do
      indian_currency1 = IndianCurrency.new(5,40)
      indian_currency2 = IndianCurrency.new(1,200)
      indian_currency3 = IndianCurrency.new(8,40)
      expect(indian_currency1 + indian_currency2).to eq(indian_currency3)
    end

    it "sum of money with 5 rupees 40 paise and nilis equal to nil" do
      indian_currency1 = IndianCurrency.new(5,40)
      indian_currency2 = nil
      indian_currency3 = nil
      expect(indian_currency1 + indian_currency2).to eq(indian_currency3)
    end
  end

  describe "Deduction" do
    it "with 5 rupees 40 paise after deduction of 1 rupee 30 paise should be equal to 4 rupees 70 paise" do
      indian_currency1 = IndianCurrency.new(5,40)
      indian_currency2 = IndianCurrency.new(1,30)
      indian_currency3 = IndianCurrency.new(4,10)
      expect(indian_currency1 - indian_currency2).to eq(indian_currency3)
    end

    it "with 2 rupees 400 paise after deduction of 2 rupee 540 paise should be equal to -1 rupees -40 paise" do
      indian_currency1 = IndianCurrency.new(2,400)
      indian_currency2 = IndianCurrency.new(2,540)
      indian_currency3 = IndianCurrency.new(-1,-40)
      expect(indian_currency1 - indian_currency2).to eq(indian_currency3)
    end

    it "with 2 rupees 400 paise after deduction nil should be equal to nil" do
      indian_currency1 = IndianCurrency.new(2,400)
      indian_currency2 = nil
      indian_currency3 = nil
      expect(indian_currency1 - indian_currency2).to eq(indian_currency3)
    end

    it "with 2 rupees 400 paise after deduction with some other object should be equal to nil" do
      indian_currency1 = IndianCurrency.new(2,400)
      indian_currency2 = 5
      indian_currency3 = nil
      expect(indian_currency1 - indian_currency2).to eq(indian_currency3)
    end
  end
end