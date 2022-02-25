require 'pry'

class CashRegister

    attr_reader :discount, :items
    attr_accessor :total, :last_price

    def initialize(employee_discount=0)
        @total=0
        @discount=employee_discount
        @items = []
        @last_price = 0
    end

    # def total=(total)
    #     @total
    # end

    # def total
    #     @total
    # end

    def add_item(title, price, quantity=1)
        quantity.times do
            self.items << title
        end

        # last price in line 30 is calling attr_accessor in line 6
        self.last_price = price * quantity

        self.total += price * quantity
    end

    def apply_discount
        if (self.discount) > 0
            self.total = self.total - (self.discount.to_f / 100) * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.total = self.total - self.last_price
    end

    # binding.pry
end