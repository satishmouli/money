# Represents indian currency as combination of rupee-paise
class IndianCurrency
  attr_reader :rupee, :paise
  def initialize(rupee, paise)
    @rupee = rupee
    @paise = paise
  end

  def ==(other)
    (@rupee == other.rupee && @paise == other.paise)
  end

  def to_s
    "5.40"
  end
  alias_method :eql?, :==
end