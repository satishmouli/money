# Represents money as paise
require_relative './negative_money_error'
class Money
  attr_reader :paise
  def initialize(rupee, paise)
    paise_temp = rupee*100 + paise
    raise NegativeMoneyError.new("Negative Money Creation") if paise_temp<0
    @paise = paise_temp

  end

  def self.initialize_paise(paise)
    new(0, paise)
  end

  def ==(other)
    return false unless (other && other.class == self.class)
    (@paise == other.paise)
  end
  
  def +(other)
    return nil unless (other && other.class == self.class)
    Money.initialize_paise(@paise + other.paise)
  end

  def -(other)
    return nil unless (other && other.class == self.class)
    raise NegativeMoneyError.new("Negative Money") if (@paise - other.paise)<0
    Money.initialize_paise(@paise - other.paise)
  end

  def to_s
    res = ""
    paise_abs = @paise.abs
    rupee = paise_abs/100
    paise_temp = paise_abs%100
    res = res + "- " if paise < 0
    res = res + "Rupee #{rupee}" if rupee != 0
    res = res + " " if rupee != 0 && paise_temp != 0
    res = res + "Paise #{paise_temp}" if paise_temp != 0
    res
  end

  def hash
    [paise].hash
  end
  alias_method :eql?, :==
end