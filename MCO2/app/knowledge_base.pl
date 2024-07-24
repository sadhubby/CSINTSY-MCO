:- dynamic has_symptom/2.
:- dynamic forget_count/1.
forget_count(0).
/*SYMPTOMS*/

/*Symptoms for covid19*/
symptom(covid19, fever).
symptom(covid19, fatigue).
symptom(covid19, loss_of_taste).
symptom(covid19, coughing).

/*Symptoms for flu*/
symptom(flu, fever).
symptom(flu, body_aches).
symptom(flu, coughing).
symptom(flu, loss_of_appetite).

/*Symptoms for tonsillitis*/
symptom(tonsillitis, sore_throat).
symptom(tonsillitis, fever).
symptom(tonsillitis, swollen_neck).

/*Symptoms for asthma*/
symptom(asthma, wheezing).
symptom(asthma, difficulty_breathing).
symptom(asthma, coughing).

/*Symptoms for common cold*/
symptom(common_cold, sore_throat).
symptom(common_cold, wheezing).
symptom(common_cold, fever).

/*symptoms for bronchitis*/
symptom(bronchitis, fever).
symptom(bronchitis, runny_nose).
symptom(bronchitis, difficulty_breathing).

symptom(dementia, forgets_easily).

/**/
/*MEDICATIONS*/

/*Medication for covid19*/
medication(covid19, antiviral).

/*Medication for flu*/
medication(flu, antiviral).
medication(flu, bedrest).

/*Medication for tonsillitis*/
medication(tonsillitis, antibiotic).
medication(tonsillitis, hydration).

/*Medication for asthma*/
medication(asthma, oral_corticosteroids).
medication(asthma, inhaler).

/*medication for common cold*/
medication(common_cold, decongestants).
medication(common_cold, antihistamines).

medication(bronchitis, antiviral).
medication(bronchitis, anti-inflammatory).

medication(dementia, cognitive_therapy).
/*PREVENTION*/

/*Prevention for covid19*/
prevention(covid19, wear_facemask).
prevention(covid19, vaccination).

/*Prevention for flu*/
prevention(flu, vaccination).
prevention(flu, wash_hands_often).

/*Prevention for tonsilitis*/
prevention(tonsillitis, avoid_sharing_utensils).
prevention(tonsillitis, wash_hands_often).

/*Prevention for asthma*/
prevention(asthma, avoid_triggers).
prevention(asthma, ready_inhaler).

/*prevention for common cold*/
prevention(common_cold, wash_hands_often).

/*prevention for bronchitis*/
prevention(bronchitis, avoid_smoking).
prevention(bronchitis, avoid_triggers).

prevention(dementia, mental_exercises).
prevention(dementia, avoid_smoking).
/*DISEASE RULES*/

/*Disease rule for covid*/
disease(Patient, covid19) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, coughing),
    has_symptom(Patient, fatigue),
    has_symptom(Patient, loss_of_taste).

/*Disease rule for flu*/
disease(Patient, flu) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, body_aches),
    has_symptom(Patient, loss_of_appetite),
    has_symptom(Patient, coughing).

/*Disease rule for tonsilitis*/
disease(Patient, tonsillitis) :-
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, fever),
    has_symptom(Patient, swollen_neck).

/*Disease rule for asthma*/
disease(Patient, asthma) :-
    has_symptom(Patient, wheezing),
    has_symptom(Patient, difficulty_breathing),
    has_symptom(Patient, coughing).

/*Disease rule for common_cold*/
disease(Patient, common_cold) :-
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, wheezing),
    has_symptom(Patient, fever).

/*Disease rule for bronchitis*/
disease(Patient, bronchitis) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, runny_nose),
    has_symptom(Patient, difficulty_breathing).

/*disease rule for dementia*/
disease(Patient, dementia) :-
    has_symptom(Patient, forgets_easily),
    forget_count(Count),
    Count > 1.

/*TREATMENT RULES*/

/*Treatment rule*/
treatment(Patient, Medication) :-
    disease(Patient, Disease),
    medication(Disease, Medication).

/*PREVENTION RULES*/
preventative(Patient, Action) :-
    disease(Patient, Disease),
    prevention(Disease, Action).













