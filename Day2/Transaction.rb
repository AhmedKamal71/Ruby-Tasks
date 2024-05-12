class Transaction
  attr_reader :user
  attr_reader :value
  def initialize(user, value)
    @user = user
    @value = value
  end
end
