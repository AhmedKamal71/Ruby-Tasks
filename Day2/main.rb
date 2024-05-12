require_relative 'Bank'
require_relative 'Logger'
require_relative 'Transaction'
require_relative 'CBABank'
require_relative 'User'

users = [
  User.new("Ali", 200),
  User.new("Peter", 500),
  User.new("Manda", 100)
]

out_side_bank_users = [
  User.new("Menna", 400),
]

transactions = [
  Transaction.new(users[0], -20),
  Transaction.new(users[0], -30),
  Transaction.new(users[0], -50),
  Transaction.new(users[0], -100),
  Transaction.new(users[0], -100),
  Transaction.new(out_side_bank_users[0], -100)
]

cba_bank = CBABank.new

cba_bank.process_transactions(transactions, users) do |status, transaction|
  puts "Transaction with user #{transaction.user.name} was #{status}"
  if status == "success"
    puts "User #{transaction.user.name} balance is #{transaction.user.balance}"
  elsif status == "failure"
    puts "User #{transaction.user.name} balance is #{transaction.user.balance}"
  end
end
