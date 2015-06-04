class NegativeMoneyError < RuntimeError
  attr_reader :message
  def initialize(message)
    super(message)
  end
end