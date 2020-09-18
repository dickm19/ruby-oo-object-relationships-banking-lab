class Transfer
    attr_accessor :transfer, :sender, :receiver, :status, :amount
    def initialize(sender, receiver, amount)
      @transfer = transfer
      @sender = sender
      @status = "pending"
      @receiver = receiver
      @amount = amount
    end

    def valid?
      @sender.valid?
      @receiver.valid? 
    end
    
    def execute_transaction
      if self.status == "pending" && @sender.balance >= @amount && @sender.valid? && @receiver.valid?
        @sender.balance -= @amount
        @receiver.balance += @amount
        self.status = "complete"
      else
        self.status = "rejected"
        p "Transaction rejected. Please check your account balance."
      end
    end

    def reverse_transfer
      if status == "complete"
          sender.balance += @amount
          receiver.balance -= @amount
          self.status = "reversed"
      end
    end
end
