class Customer
    attr_accessor :name, :age
    @@all = []
    def initialize(name, age)
        self.name = name
        self.age = age
        self.class.all << self
    end
    def self.all
        @@all
    end

    def new_meal(waiter, total, tip)
        Meal.new(waiter, self, total, tip)
    end
    def meals
        Meal.all.select {|meal| meal.customer == self}
    end
    def waiters
        self.meals.collect {|meal| meal.waiter}
    end
end