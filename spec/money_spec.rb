
require_relative './spec_helper'

describe Money do
  describe "Equality" do
    it "is equal to itself" do
      money = Money.new(10,40)
      expect(money).to eq(money)
    end

    it "with equal rupee and paise are equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,40)
      expect(money1).to eq(money2)
    end

    it "with different rupee and paise are not equal" do
      money1 = Money.new(10,40)
      money2 = Money.new(10,45)
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1).to eq(money2)
    end

    it "is not equal to nil money object" do
      money1 = Money.new(10,40)
      money2 = nil
      expect(money1).to_not eq(money2)
    end

    it "is not equal to some object" do
      money1 = Money.new(10,40)
      money2 = 5
      expect(money1).to_not eq(money2)
    end

    it "with 1 rupee and 40 paise should be equal to money with 0 rupee and 140 paise in terms of hash" do
      money1 = Money.new(1,40)
      money2 = Money.new(0,140)
      expect(money1.hash).to eq(money2.hash)
    end
  end

  describe "Summation" do
    it "sum of money with 5 rupees 40 paise and 1 rupee 30 paise should be equal to money with 6 rupees 70 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(6,70)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and 1 rupee 200 paise should be equal to money with 8 rupees 40 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,200)
      money3 = Money.new(8,40)
      expect(money1 + money2).to eq(money3)
    end

    it "sum of money with 5 rupees 40 paise and nilis equal to nil" do
      money1 = Money.new(5,40)
      money2 = nil
      money3 = nil
      expect(money1 + money2).to eq(money3)
    end
  end

  describe "Deduction" do
    it "with 5 rupees 40 paise after deduction of 1 rupee 30 paise should be equal to 4 rupees 10 paise" do
      money1 = Money.new(5,40)
      money2 = Money.new(1,30)
      money3 = Money.new(4,10)
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction of 2 rupee 540 paise should raise Negative Money exception" do
      money1 = Money.new(2,400)
      money2 = Money.new(2,540)
      expect {money1 - money2}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupees 400 paise after deduction of 10 rupee 40 paise should raise Negative Money exception" do
      money1 = Money.new(2,400)
      money2 = Money.new(10,40)
      expect {money1 - money2}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupees 400 paise after deduction nil should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = nil
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end

    it "with 2 rupees 400 paise after deduction with some other object should be equal to nil" do
      money1 = Money.new(2,400)
      money2 = 5
      money3 = nil
      expect(money1 - money2).to eq(money3)
    end
  end

  describe "MoneyToText" do

    it "with 2 rupees 400 paise should return Rupee 2 Paise 400" do
      money = Money.new(2,440)
      expect(money.to_s).to eq("Rupee 6 Paise 40")
    end

    it "with  0 rupee 0 paisa should return empty string" do
      money = Money.new(0,0)
      expect(money.to_s).to eq("")
    end

  end

  describe "Negative Money Initialization" do
    it "with -2 rupees 40 paise should raise Negative Money exception" do
      expect {Money.new(-2,40)}.to raise_error(NegativeMoneyError)
    end

    it "with 2 rupee - 400 paisa should aise Negative Money exception" do
      expect {Money.new(2,-400)}.to raise_error(NegativeMoneyError)
    end

    it "with  -2 rupee -50 paisa aise Negative Money exception" do
      expect {Money.new(-2,-50)}.to raise_error(NegativeMoneyError)
    end
  end

  describe "Sorting Money" do
    it "with 2 rupees 40 paise, 4 rupees 10 paise, 400 paise should return 2 rupees 40 paise, 400 paise, 4 rupees 10 paise , " do
      money_array = [Money.new(2,40), Money.new(4,10), Money.new(0,400)]
      sorted_money_array = money_array.sort! { |x,y| x <=> y }
      expected_money_array = [Money.new(2,40), Money.new(0,400), Money.new(4,10)]
      expect(sorted_money_array).to eq(expected_money_array)
    end

    it "with 3 rupees 20 paise, 6 rupees ,1 rupee 40 paise should return 1 rupee 40 paise, 3 rupees 20 paise, 6 rupees" do
      money_array = [Money.new(3,20), Money.new(6,0), Money.new(1,40)]
      sorted_money_array = money_array.sort! { |x,y| x <=> y }
      expected_money_array = [Money.new(1,40), Money.new(3,20), Money.new(6,0)]
      expect(sorted_money_array).to eq(expected_money_array)
    end

    it "with 3 rupees 40 paise, 3 rupees 40 paise, 600 paise should return 3 rupees 40 paise, 600 paise, 7 rupees 20 paise , " do
      money_array = [Money.new(3,40), Money.new(3,40), Money.new(0,600)]
      sorted_money_array = money_array.sort! { |x,y| x <=> y }
      expected_money_array = [Money.new(3,40), Money.new(3,40), Money.new(0,600)]
      expect(sorted_money_array).to eq(expected_money_array)
    end

    it "with 3 rupees 40 paise is not greater than 7 rupees 40 paise and should return false " do
      expect(Money.new(3,40) > Money.new(7,40)).to eq(false)
    end

    it "with 7 rupees 40 paise is greater than 3 rupees 40 paise and should return true " do
      expect(Money.new(7,40) > Money.new(3,40)).to eq(true)
    end

    it "with 3 rupees 40 paise is not greater than 3 rupees 40 paise and should return false " do
      expect(Money.new(3,40) > Money.new(3,40)).to eq(false)
    end
  end

end