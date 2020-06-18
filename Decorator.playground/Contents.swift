import UIKit

protocol Pizza {
    var description: String { get }
    func cost() -> Double
}

struct ThinCrustPizza: Pizza {
    var description: String {
        return "Thin Crust Pizza"
    }

    func cost() -> Double {
        return 19.99
    }
}

struct ThickCrustPizza: Pizza {
    var description: String {
        return "Thick Crust Pizza"
    }

    func cost() -> Double {
        return 29.99
    }
}

protocol ToppingDecorator: Pizza {}

struct CheeseTopping: ToppingDecorator {
    private let pizza: Pizza

    init(pizza: Pizza) {
        self.pizza = pizza
    }

    var description: String {
        return pizza.description + ", Cheese Topping"
    }

    func cost() -> Double {
        return pizza.cost() + 4.99
    }
}

struct OlivesTopping: ToppingDecorator {
    private let pizza: Pizza

    init(pizza: Pizza) {
        self.pizza = pizza
    }

    var description: String {
        return pizza.description + ", Olives Topping"
    }

    func cost() -> Double {
        return pizza.cost() + 2.99
    }
}

struct PeppersTopping: ToppingDecorator {
    private let pizza: Pizza

    init(pizza: Pizza) {
        self.pizza = pizza
    }

    var description: String {
        return pizza.description + ", Peppers Topping"
    }

    func cost() -> Double {
        return pizza.cost() + 1.99
    }
}

var pizza: Pizza = ThinCrustPizza()
pizza = CheeseTopping(pizza: pizza)
pizza = CheeseTopping(pizza: pizza)
pizza = OlivesTopping(pizza: pizza)
pizza = PeppersTopping(pizza: pizza)

print("Final Pizza Order is: \(pizza.description)")
print("Final Pizza Cost is: \(pizza.cost())")
