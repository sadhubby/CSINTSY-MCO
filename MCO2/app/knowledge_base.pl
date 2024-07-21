:- dynamic has_symptom/2.
/*SYMPTOMS*/

/*Symptoms for covid19*/
symptom(covid19, fever).
symptom(covid19, fatigue).
symptom(covid19, loss_of_taste).
symptom(covid19, loss_of_appetite).

/*Symptoms for flu*/
symptom(flu, fever).
symptom(flu, chills).
symptom(flu, muscle_aches).
symptom(flu, cough).
symptom(flu, loss_of_appetite).

/*Symptoms for tonsilitis*/
symptom(tonsilitis, sore_throat).
symptom(tonsilitis, fever).
symptom(tonsilitis, swollen_neck).

/*Symptoms for asthma*/
symptom(asthma, wheezing).
symptom(asthma, difficulty_breathing).
symptom(asthma, coughing).

/*MEDICATIONS*/

/*Medication for covid19*/
medication(covid19, oral_antiviral).

/*Medication for flu*/
medication(flu, antiviral).
medication(flu, bedrest).

/*Medication for tonsilitis*/
medication(tonsilitis, antibiotic).
medication(tonsilitis, hydration).

/*Medication for asthma*/
medication(asthma, oral_corticosteroids).
medication(asthma, inhaler).

/*PREVENTION*/

/*Prevention for covid19*/
prevention(covid19, wear_facemask).
prevention(covid19, vaccination).

/*Prevention for flu*/
prevention(flu, vaccination).

/*Prevention for tonsilitis*/
prevention(tonsilitis, distance_from_others).
prevention(tonsilitis, wash_hands_often).

/*Prevention for asthma*/
prevention(asthma, avoid_triggers).
prevention(asthma, ready_inhaler).

/*DISEASE RULES*/

/*Disease rule for covid*/
disease(Patient, covid19) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, dry_cough),
    has_symptom(Patient, fatigue).

/*Disease rule for flu*/
disease(Patient, flu) :-
    has_symptom(Patient, fever),
    has_symptom(Patient, chills),
    has_symptom(Patient, muscles_ache),
    has_symptom(Patient, cough).

/*Disease rule for tonsilitis*/
disease(Patient, tonsilitis) :-
    has_symptom(Patient, sore_throat),
    has_symptom(Patient, fever),
    has_symptom(Patient, swollen_neck).

/*Disease rule for asthma*/
disease(Patient, asthma) :-
    has_symptom(Patient, wheezing),
    has_symptom(Patient, difficulty_breathing),
    has_symptom(Patient, coughing).

/*TREATMENT RULES*/

/*Treatment rule for covid19*/
treatment(Patient, Medication) :-
    disease(Patient, Disease),
    medication(Disease, Medication).

/*PREVENTION RULES*/
preventative(Patient, Action) :-
    disease(Patient, Disease),
    prevention(Disease, Action).

/*EXPERT SYSTEM*/
ask_symptoms :-
    write('Enter a symptom (or "done" if finished): '),
    read(Symptom),
    (Symptom == done ->
    true;
    assertz(has_symptom(patient, Symptom)),
    ask_symptoms
    ).

diagnose :-
    disease(patient, Disease),
    write('Diagnosis: '), write(Disease), nl,
    treatment(patient, Medication),
    write('Prescribing you: '), write(Medication), nl,
    preventative(patient, Action),
    write('To prevent: '), write(Action), nl.

start_diagnosis :-
    retractall(has_symptom(patient, _)),
    ask_symptoms,
    (   diagnose ->
    true;
    write('No diagnosis could be made.'), nl
    ).

