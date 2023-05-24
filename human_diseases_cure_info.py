import pandas as pd

# Define the data
data = {
    'Disorder/Disease': ['Common Cold', 'Influenza (Flu)', 'Hypertension (High Blood Pressure)', 'Diabetes', 'Heart Disease', 'Asthma', 'Arthritis', 'Depression', 'Anxiety Disorders', 'Allergies'],
    'Natural Cure': ['Rest, hydration, warm liquids (like chicken soup), saline nasal sprays', 'Rest, hydration, warm liquids', 'Regular exercise, a healthy diet low in sodium, stress management', 'Healthy diet, regular exercise, maintaining a healthy weight', 'Regular exercise, healthy diet, quitting smoking', 'Breathing exercises, maintaining a healthy weight, avoiding triggers', 'Physical activity, heat and cold therapy, weight loss if overweight', 'Exercise, sleep, a healthy diet, mindfulness meditation', 'Stress management techniques, exercise, relaxation techniques', 'Avoiding allergens, nasal rinse'],
    'Medicinal Cure': ['Over-the-counter cold remedies, decongestants, pain relievers', 'Antiviral drugs prescribed by a doctor', 'Antihypertensive medications', 'Insulin therapy, oral or injected medications', 'Medications, surgery, lifestyle changes', 'Inhalers, long-term control medications', 'Pain relievers, anti-inflammatory drugs, physical therapy', 'Antidepressants, psychotherapy', 'Psychotherapy, medications', 'Antihistamines, nasal steroids, allergy shots']
}

# Create a DataFrame
df = pd.DataFrame(data)

# Write to an Excel file
df.to_excel('health_disease_cure_info.xlsx', index=False)
