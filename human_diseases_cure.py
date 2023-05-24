"""
Title: Human Society Simulation with Multiple Sicknesses
Date: 24 May, 2023
Author : ChatGPT4
Description: This Python script simulates a society of humans, each with a potential set of sicknesses. 
             Each sickness has a severity level and the script suggests natural and medicinal cures for each sickness. 
             The script also simulates the application of these cures and the resulting change in sickness severity.
"""



class Sickness:
    def __init__(self, name, natural_cure, medicinal_cure):
        self.name = name
        self.natural_cure = natural_cure
        self.medicinal_cure = medicinal_cure

class Human:
    def __init__(self, name, age, gender):
        self.name = name
        self.age = age
        self.gender = gender
        self.health_state = {}  # Dictionary to hold sicknesses and their severity (0-1)

    def update_health_state(self, sickness, severity):
        self.health_state[sickness] = severity

    def evaluate_sickness_feeling(self):
        sickness_feeling = 0
        for sickness, severity in self.health_state.items():
            sickness_feeling += severity  # Weighted sum of sickness severities
        return sickness_feeling

    def suggest_cure(self):
        for sickness in self.health_state.keys():
            print(f"For {sickness.name}, the suggested natural cure is {sickness.natural_cure} and the medicinal cure is {sickness.medicinal_cure}.")

    def apply_cure(self, cure_type):
        for sickness in self.health_state.keys():
            if cure_type == "natural":
                cure = sickness.natural_cure
            elif cure_type == "medicinal":
                cure = sickness.medicinal_cure
            else:
                print("Invalid cure type.")
                return

            # Update health state based on cure
            self.health_state[sickness] -= 0.1  # Example: reduce severity by 10%
            if self.health_state[sickness] < 0:
                self.health_state[sickness] = 0

# Example usage
flu = Sickness("Flu", "Rest and hydration", "Antiviral drugs")
cold = Sickness("Cold", "Rest and hydration", "Over-the-counter cold remedies")

john = Human("John", 30, "Male")

john.update_health_state(flu, 0.5)
john.update_health_state(cold, 0.3)

print(john.evaluate_sickness_feeling())  # Outputs: 0.8

john.suggest_cure()  # Outputs: For Flu, the suggested natural cure is Rest and hydration and the medicinal cure is Antiviral drugs. For Cold, the suggested natural cure is Rest and hydration and the medicinal cure is Over-the-counter cold remedies.

john.apply_cure("natural")
print(john.evaluate_sickness_feeling())  # Outputs: 0.6
