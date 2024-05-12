require_relative 'Bank'
require_relative 'Logger'

class CBABank < Bank
  include Logger

  def process_transactions(transactions, users, &callback)
    transactions.each do |t|
      begin
        balance = t.user.balance
        if balance + t.value < 0
          raise "Insufficient funds"
        elsif !users.include?(t.user)
          raise "User not found"
        else
          if balance == 0
            log_warning("User #{t.user.name} has no balance")
          end
          t.user.balance += t.value
          log_info("Transaction processed for #{t.user.name} with value #{t.value}")
          callback.call("Success", t)
        end
      rescue => e
        log_error("Transaction failed for #{t.user.name} with value #{t.value} - #{e.message}")
        callback.call("Failed", t)
      end
    end
  end
end
