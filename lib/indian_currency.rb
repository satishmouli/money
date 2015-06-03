# Represents indian currency as combination of rupee-paise
class IndianCurrency
  attr_reader :rupee, :paise
  def initialize(rupee, paise)
    @rupee = rupee + paise/100
    @paise = paise % 100
  end

  def ==(other)
    if other && other.class == self.class
      (@rupee == other.rupee && @paise == other.paise)
    end
  end
  
  def +(other)
    IndianCurrency.new(@rupee + other.rupee, @paise + other.paise)
  end

  #[rupee, paise].hash
  alias_method :eql?, :==
end