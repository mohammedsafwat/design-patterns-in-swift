protocol Duck {
    func quack()
    func fly()
}

struct MallardDuck: Duck {
    func quack() {
        print("Mallard Duck Quacking")
    }

    func fly() {
        print("Mallard Duck Flying")
    }
}

protocol Turkey {
    func gobble()
    func fly()
}

struct WildTurkey: Turkey {
    func gobble() {
        print("Wild Turkey Gobbling")
    }

    func fly() {
        print("Wild Turkey Flying")
    }
}

struct TurkeyAdapter: Duck {
    let turkey: Turkey

    func quack() {
        turkey.gobble()
    }

    func fly() {
        for _ in 0..<5 {
            turkey.fly()
        }
    }
}

protocol Drone {
    func beep()
    func spinRotors()
    func takeOff()
}

struct SuperDrone: Drone {
    func beep() {
        print("Super Drone Beeping")
    }

    func spinRotors() {
        print("Super Drone Spinning Rotors")
    }

    func takeOff() {
        print("Super Drone Spinning Taking Off")
    }
}

struct DroneAdapter: Duck {
    let drone: Drone

    func quack() {
        drone.beep()
    }

    func fly() {
        drone.spinRotors()
        drone.takeOff()
    }
}

func testDuck(duck: Duck) {
    duck.quack()
    duck.fly()
}

// MARK: - Entry Point

let mallardDuck = MallardDuck()
testDuck(duck: mallardDuck)

let wildTurkey = WildTurkey()
let wildTurkeyAdapter = TurkeyAdapter(turkey: wildTurkey)
testDuck(duck: wildTurkeyAdapter)

let superDrone = SuperDrone()
let superDroneAdapter = DroneAdapter(drone: superDrone)
testDuck(duck: superDroneAdapter)
