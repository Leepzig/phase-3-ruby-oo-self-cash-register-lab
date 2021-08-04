require 'pry'

class CashRegister
  
  def initialize(*employee_discount)
    @discount = employee_discount[0]
    @total = 0
    @items = []
  end

  attr_reader :discount
  attr_accessor :total

  def total
    @total
  end

  def add_item(item, price, *quantity)
    if quantity[0]
      @total += price * quantity[0]
      @last_transaction = price * quantity[0]
      while quantity[0] > 0
        @items << item
        quantity[0] -= 1
      end
    else
      @total += price
      @items << item
      @last_transaction = price
    end
  end

  def apply_discount
    if !discount
      "There is no discount to apply."
    else
      @total = @total - (@total * @discount/100)
      "After the discount, the total comes to $#{@total}."
    end
  end

attr_accessor :items
attr_accessor :last_transaction

def void_last_transaction
  @items.pop
  @total -= @last_transaction
end

end


# binding.pry