//paziente di test
Instance: Paziente-test
InstanceOf: PatientItcore
Usage: #example
Description: "Esempio di un paziente: soggetto iscritto al Sistema Sanitario Nazionale (SSN) con rappresentazione strutturata dell'attributo birthPlace."

* id = "c59b12af-f741-4758-a677-76ea7c69251f"

* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "GRGVRD06D02F611G"
* birthDate = "2006-04-02"
* name.family = "Verdi"
* name.given = "Gregorio"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Patient example</div>"

// encounter di test
Instance: Encounter-test
InstanceOf: EncounterRefertoLabIt
Description: "Esempio di incontro: informazioni di base per descrivere un incontro ambulatoriale pianificato."
* id = "8bbd0a82-d57b-442b-9695-f2e89ca86e58"
* class = $cs-coveragetype#AMB
* status = #finished
* subject = Reference(urn:uuid:c59b12af-f741-4758-a677-76ea7c69251f)
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Encounter example</div>"

//bundle di test
Instance: Bundle-test
InstanceOf: bundle-it-lab
Title: "Bundle document - Referto di Medicina di Laboratorio"  
* timestamp = "2023-02-25T14:30:00+01:00"
* type = #document
* timestamp = "2023-02-25T14:30:00+01:00"
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:f73457c2-1eba-4a02-8ca0-0c7b582939ef"
* entry[composition].fullUrl = "urn:uuid:be1c737f-251f-470f-b9db-a776f47957e8" 
* entry[composition].resource = Composition-test
* entry[patient].fullUrl = "urn:uuid:c59b12af-f741-4758-a677-76ea7c69251f" 
* entry[patient].resource = Paziente-test
* entry[diagnosticReport].fullUrl = "urn:uuid:3a743273-237a-446a-a8da-9e7521cce613" 
* entry[diagnosticReport].resource = DiagnosticReport-test
* entry[encounter].fullUrl = "urn:uuid:8bbd0a82-d57b-442b-9695-f2e89ca86e58"
* entry[encounter].resource = Encounter-test
* entry[practitioner].fullUrl = "urn:uuid:4028a0b8-37fc-4491-a8e7-0f28e6fc59b0"
* entry[practitioner].resource = Practitioner-test
* entry[organization].fullUrl = "urn:uuid:3c75bf31-bd32-4c0f-9e4a-585d20c08ce1" 
* entry[organization].resource = Organization-test

//diagnostic report di test
Instance: DiagnosticReport-test
InstanceOf: diagnosticreport-it-lab
Usage: #inline
* id = "3a743273-237a-446a-a8da-9e7521cce613"
* extension[DiagnosticReportCompositionR5].valueReference = Reference(urn:uuid:be1c737f-251f-470f-b9db-a776f47957e8) //ref a composition
* status = #final
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4028a0b8-37fc-4491-a8e7-0f28e6fc59b4"
/* * category = $v2-0074#MB "Microbiology" */
* code = $loinc#11502-2 "Laboratory report"
* subject = Reference(urn:uuid:c59b12af-f741-4758-a677-76ea7c69251f)

//composition di test
Instance: Composition-test
InstanceOf: CompositionRefertoLabIt
Usage: #inline
* id = "be1c737f-251f-470f-b9db-a776f47957e8"
* language = #it-IT
//* extension[diagnosticReport].valueReference = Reference(urn:uuid:3a743273-237a-446a-a8da-9e7521cce613)
* identifier.system = "urn:ietf:rfc:3986"
* identifier.value = "urn:uuid:4028a0b8-37fc-4491-a8e7-0f28e6fc59b2"
* status = #final
* type = $loinc#11502-2 "Laboratory report"
* subject = Reference(urn:uuid:c59b12af-f741-4758-a677-76ea7c69251f)
* date = "2022-10-25T14:30:00+01:00"
* author = Reference(urn:uuid:4028a0b8-37fc-4491-a8e7-0f28e6fc59b0)
* title = "Referto di Laboratorio"
* attester[legalAuthenticator].mode = #legal
* attester[legalAuthenticator].party = Reference(urn:uuid:4028a0b8-37fc-4491-a8e7-0f28e6fc59b0)
* attester[legalAuthenticator].time = "2020-12-27T14:30:00+01:00"
* confidentiality = #L
* custodian = Reference(urn:uuid:3c75bf31-bd32-4c0f-9e4a-585d20c08ce1)
* section[annotations].code = $loinc#48767-8 "Annotation comment [Interpretation] Narrative"
* section[annotations].title = "Annotation comment [Interpretation] Narrative."
* section[annotations].title = "Note e commenti"
* section[annotations].text.status = #generated
* section[annotations].text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Il referto di laboratorio è stato emesso in data 25/02/2026 alle ore 12:45. Il referto è stato firmato digitalmente dal medico responsabile del laboratorio.</div>"
* encounter = Reference(urn:uuid:8bbd0a82-d57b-442b-9695-f2e89ca86e58)

//practitioner di test
Instance: Practitioner-test
InstanceOf: PractitionerItcore
Usage: #inline
* id = "4028a0b8-37fc-4491-a8e7-0f28e6fc59b0"
* identifier.use = #official
* identifier[codiceFiscale].system = "urn:oid:2.16.840.1.113883.2.9.4.3.2"
* identifier[codiceFiscale].value = "MDCPRV80A01H501G"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Practitioner example</div>"

//organization di test
Instance: Organization-test
InstanceOf: OrganizationItCore
Usage: #inline
Description: "Esempio di organizzazione ASL rappresentata tramite il profilo OrganizationItCore"
* id = "3c75bf31-bd32-4c0f-9e4a-585d20c08ce1"
* identifier[aslRegione].system = "urn:oid:2.16.840.1.113883.2.9.4.1.1"
* identifier[aslRegione].value = #120202
* active = 	true
//* type = $CS-tipoEntita#asl "Azienda Sanitaria Locale"
* name = "ASL ROMA 2"
* telecom[0].system = #phone
* telecom[0].value = "0651004555"
* telecom[1].system = #url
* telecom[1].value = "http://www.aslroma2.it"
* text.status = #generated
* text.div = "<div xmlns=\"http://www.w3.org/1999/xhtml\">Organization example</div>"
