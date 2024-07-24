:- [knowledge_base].

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
    nl, write('Diagnosis: '), write(Disease), nl,
    findall(Med, treatment(patient, Med), Medications),
    (Medications \= [] ->
         nl, write('Prescribing you: '),nl, print_list(Medications), nl),
    findall(Act, preventative(patient, Act), Actions),
    (Actions \= [] ->
    write('To prevent: '), nl, print_list(Actions), nl);
    write('No diagnosis could be found.'), nl
).

print_list([]).
print_list([H|T]):-
    write('- '), write(H), nl,
    print_list(T).


start_diagnosis :-
    retractall(has_symptom(patient, _)),
    retractall(forget_count(_)),
    assertz(forget_count(0)),
    ask_symptoms,
   (diagnose -> true).
