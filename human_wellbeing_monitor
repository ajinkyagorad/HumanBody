#!/usr/bin/env python3
"""
human_wellbeing_monitor.py

This script allows individuals to monitor and reflect upon their wellbeing 
based on various aspects of human life. Each aspect is rated between 0 and 1,
where 1 indicates full satisfaction/contentment and 0 indicates none.

By consistently using this tool, one can gauge changes and trends in their 
wellbeing over time, thereby identifying areas that might need more attention.

Usage:
    Run the script and follow the prompts to input scores for each aspect.
    At the end, an overall "Quality State of Human Wellbeing" will be provided.
"""

def get_user_input(aspect):
    """Prompt the user for a score and ensure it's within the valid range."""
    while True:
        try:
            score = float(input(f"Rate your {aspect} (0 to 1): "))
            if 0 <= score <= 1:
                return score
            else:
                print("Error: Please enter a value between 0 and 1.")
        except ValueError:
            print("Error: Invalid input. Please enter a number between 0 and 1.")

def main():
    aspects = [
        "Physical Wellbeing",
        "Safety",
        "Love and Belonging",
        "Purpose",
        "Self-esteem",
        "Personal Growth",
        "Autonomy",
        "Recreation and Leisure",
        "Creative Expression",
        "Connection to Nature",
        "Intimacy",
        "Legacy",
        "Spirituality",
        "Adventure",
        "Resilience",
        "Validation",
        "Altruism"
    ]
    
    total_score = 0

    print("\nHuman Wellbeing Monitor\n")
    print("Rate each aspect of your life from 0 (not satisfied) to 1 (fully satisfied).\n")

    for aspect in aspects:
        total_score += get_user_input(aspect)

    overall_wellbeing = total_score / len(aspects)

    print("\nYour Quality State of Human Wellbeing is:", round(overall_wellbeing, 2))
    print("\nThe higher the score, the better your overall perceived wellbeing.")

if __name__ == "__main__":
    main()
