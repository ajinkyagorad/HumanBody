class Human:
    def __init__(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender
        self.oxygen_level = 100
        self.nutrient_level = 100
        self.waste_level = 0
        self.water_level = 100
        self.energy_level = 100
        self.muscle_mass = 50

    def breathe(self):
        self.oxygen_level += 10

    def eat(self, food):
        self.nutrient_level += food.nutrient_value
        self.waste_level += food.waste_value

    def drink(self, water):
        self.water_level += water.water_value

    def exercise(self, minutes):
        self.oxygen_level -= minutes * 0.2
        self.nutrient_level -= minutes * 0.3
        self.waste_level += minutes * 0.1
        self.water_level -= minutes * 0.5
        self.energy_level -= minutes * 0.4
        self.muscle_mass += minutes * 0.01

    def rest(self, hours):
        self.oxygen_level += hours * 0.5
        self.nutrient_level -= hours * 0.1
        self.waste_level -= hours * 0.1
        self.water_level -= hours * 0.2
        self.energy_level += hours * 0.7
        if hours > 8:
            self.muscle_mass -= (hours - 8) * 0.01

    def excrete(self):
        self.waste_level = 0

    def sweat(self):
        self.water_level -= 10

    def check_status(self):
        print(f"Oxygen Level: {self.oxygen_level}")
        print(f"Nutrient Level: {self.nutrient_level}")
        print(f"Waste Level: {self.waste_level}")
        print(f"Water Level: {self.water_level}")
        print(f"Energy Level: {self.energy_level}")
        print(f"Muscle Mass: {self.muscle_mass}")

class Food:
    def __init__(self, nutrient_value, waste_value):
        self.nutrient_value = nutrient_value
        self.waste_value = waste_value

class Water:
    def __init__(self, water_value):
        self.water_value = water_value
