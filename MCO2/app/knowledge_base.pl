:- dynamic has_symptom/2.
:- dynamic forget_count/1.
forget_count(0).
/*SYMPTOMS*/

/*Symptoms for covid19*/
symptom(covid19, fever).
symptom(covid19, fatigue).
symptom(covid19, loss_of_taste).
symptom(covid19, loss_of_appetite).

/*Symptoms for flu*/
symptom(flu, fever).
symptom(flu, muscle_aches).
symptom(flu, cough).
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
medication(covid19, oral_antiviral).

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

/*Prevention for tonsilitis*/
prevention(tonsillitis, distance_from_others).
prevention(tonsillitis, wash_hands_often).

/*Prevention for asthma*/
prevention(asthma, avoid_triggers).
prevention(asthma, ready_inhaler).

/*prevention for common cold*/
prevention(common_cold, wash_hands_often).

/*prevention for bronchitis*/
prevention(bronchitis, stop_smoking).

prevention(dementia, mental_exercises).

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
    (   Symptom == 'i_forget_easily' ->
    forget_count(Count),
    NewCount is Count + 1,
        retract(forget_count(Count)),
        assertz(forget_count(NewCount)),
        (   NewCount > 1 ->
        assertz(has_symptom(patient, forgets_easily)),
            true;
        assertz(has_symptom(patient, forgets_easily)),
            ask_symptoms
        );
    assertz(has_symptom(patient, Symptom)),
    ask_symptoms)
    ).

diagnose :-
   (disease(patient, Disease) ->
    write('Diagnosis: '), write(Disease), nl,
    treatment(patient, Medication),
    write('Prescribing you: '), write(Medication), nl,
    preventative(patient, Action),
    write('To prevent: '), write(Action), nl;
    write('No diagnosis could be found.'), nl
).
start_diagnosis :-
    retractall(has_symptom(patient, _)),
    retractall(forget_count()),
    assertz(forget_count(0)),
    ask_symptoms,
    (   diagnose ->
    true).

