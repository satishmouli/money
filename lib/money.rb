# Represents money as combination of rupee-paise
class Money
  attr_reader :paise
  def initialize(rupee, paise)
    @paise = rupee*100 + paise
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
    Money.initialize_paise(@paise - other.paise)
  end

  def hash
    [paise].hash
  end
  alias_method :eql?, :==
end