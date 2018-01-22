class CashRegister

  attr_accessor :total, :discount, :title, :price, :items, :last_transaction

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
  end

  def add_item(title, price, quantity=1)
    self.total += price * quantity
    quantity.times do
      items << title
    end
    self.last_transaction = price * quantity
  end

  def apply_discount
    if discount != 0
      self.total = total * ((100 - discount.to_f)/100)
      return "After the discount, the total comes to $#{self.total.to_i}."
    end
    return "There is no discount to apply."
  end

  def void_last_transaction
    self.total = self.total - self.last_transaction
  end
end
