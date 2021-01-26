require 'pry'

class Waiter
    attr_accessor :name, :years_of_exp
    @@all = []
    def initialize(name, years_of_exp)
        self.name = name
        self.years_of_exp = years_of_exp
        self.class.all << self
    end

    def self.all
        @@all
    end

    def new_meal(customer, total, tip)
        Meal.new(self,customer,total,tip)
    end
    def meals
        Meal.all.select {|meal| meal.waiter == self}
    end
    def best_tipper
        m_sorted = meals.sort {|a,b| b.tip <=> a.tip}
        # binding.pry
        m_sorted[0].customer
    end
end