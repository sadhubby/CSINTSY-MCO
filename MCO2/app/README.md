# CSINTSY-MCO2

For the second major course output of the course CSINTSY, the group is tasked to create an expert system. The group is tasked to choose a domain and 
the group has chosen the domain of medicine. 

The purpose of the program is to diagnose users. The users will give a set of symptoms, and the system will look through its knowledge base to find the illness.
Given an illness, it will diagnose the user, suggest medication and treatment, and a course of action for future prevention.

For this project, the group will use SWI-Prolog.

## Consulting the database

First, to initiliaze the knowledge data base, click on `File` on the top ribbon, then `Consult ...`. The file explorer window would pop-up. Please select the file called
`knowledge_base.pl`. This will initialize the database and allow to start the expert system.

## Using the system

To start the system, please type `start_diagnosis.`

The program will then ask to type a symptom. After typing a symptom, please do remember to add a period after. For example, the symptom of 
coughing will be typed as `coughing.` then press Enter. Additional note, for symptoms with spaces, use an underscore instead. For example, the symptom of
difficulty breathing will be typed as `difficulty_breathing`. 

This will loop over until the user types `done.`

Afterwards, should the program find an illness given the symptoms the user has input in the database, the program will return a diagnosis, medication for treatment, and an action for prevention.
