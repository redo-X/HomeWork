PROJEKTBESCHREIBUNG
Das Projekt ist ein reales Projekt der Firma rokatec Kabelkonfektion GmbH, wo ich (David Melcher) seit zwei Jahren als Anwendungsentwickler arbeite. Für die Dokumentation existiert in der Firma eine Betriebsdatenerfassung, die von den Mitarbeitern mit Daten gefüllt wird. Dort werden Meilensteine der Produktion Produktionsauftragsabhängig dokumentiert. Vor ein paar Wochen wurde entschieden, dass Mitarbeiter bzw. Aushilfskräfte auch bestimmte Arbeitsschritte Zuhause ausführen können. Damit auch diese Arbeitszeit bzw. Meilensteine dokumentiert werden, haben wir uns entschieden, das Web-Projekt dafür zu nutzen, um der Firma einen Prototyp zu entwickeln.
Der Prototyp wurde unabhängig von der IT-Applikationslandschaft entwickelt, um eine Benotung und unabhängiges Verwenden der Anwendung zu ermöglichen. In der Zukunft wird das Projekt noch in die Applikationslandschaft integriert und erhält Schnittstellen zu den bestehenden Systemen, sodass die Datenbereitstellung für das Web-Portal automatisiert erfolgt.
KERNFUNKTION DES PROJEKTS
Die Kernfunktion bildet die Dokumentation der Arbeitszeit, die ein Mitarbeiter an einem Produktionsauftrag arbeitet. Um den Mitarbeitern die Erfassung zu erleichtern, hat jeder Produktionsauftrag Anhänge (Dokumente für die Produktion [Stücklisten, Zeichnungen, ...]), einen Arbeitsplan, usw., welche zusätzlich durch einen Assistenten durchgeführt wird.
# WICHTIG: Wir dürfen leider nicht die Dokumente öffentlich hochladen, weil wir verpflichtet sind, die Geheimhaltung der Kunden zu wahren. #
USER-STORIES
•	Backend und Frontend sollen durch eine Anmeldung getrennt werden
•	Jeder Benutzer hat eine Rolle (Administrator oder Nutzer)
•	Mitarbeiter der Verwaltung bekommen die Rolle Administrator und die ausführenden Kräfte die Rolle Nutzer zugewiesen
FRONTEND
•	Der Mitarbeiter soll sich von Zuhause aus mit vorgegebenen Anmeldeinformationen in das Web-Portal anmelden können
•	Der Mitarbeiter soll seine Produktionsbuchungen sich ansehen können
•	Der Mitarbeiter soll in der Lage sein, seine Arbeitszeit möglichst einfach im Portal erfassen zu können
o	Eine weitere Erleichterung soll sein, dass eine Start-Buchung und eine Ende-Buchung erfolgt, sodass der Mitarbeiter nicht selber etwas aufschreiben muss
BACKEND
•	Der Mitarbeiter soll Kunden anlegen, aktualisieren und entfernen können
•	Der Mitarbeiter soll Artikelgruppen anlegen, aktualisieren und entfernen können
•	Der Mitarbeiter soll Artikel anlegen, aktualisieren und entfernen können
o	Der Mitarbeiter soll einem Artikel eine Artikelgruppe zuordnen können
•	Der Mitarbeiter soll ein Arbeitsplan anlegen, aktualisieren und entfernen können
o	Der Mitarbeiter soll einem Arbeitsplan, Arbeitsschritte zuordnen können, die vorgeben, was der Mitarbeiter an Arbeitszeit dokumentieren kann
•	Der Mitarbeiter soll Produktionsaufträge (PA) anlegen, aktualisieren und entfernen können
o	Der Mitarbeiter soll einem PA eine Arbeitsvorlage zuordnen können. Mit der Zuordnung, werden alle Arbeitsschritte in den PA kopiert, sodass der Mitarbeiter in Beziehung zu den kopierten Arbeitsschritten Buchungen vornehmen kann
o	Der Mitarbeiter soll einem PA den zu fertigenden Artikel zuordnen können
o	Der Mitarbeiter soll einem PA den Auftraggeber (Kunde) zuordnen können
o	Der Mitarbeiter soll einem PA Anhänge zuordnen können, die dem Mitarbeiter bei der Produktion unterstützende Informationen liefern
o	Der Mitarbeiter soll einem PA die Arbeitsschritte auch manuell hinzufügen und entfernen können
o	Der Mitarbeiter soll die Buchungen, die bereits in einem PA eingegangen sind, sehen können und dessen Gesamtzeit einsehen können
•	Der Mitarbeiter soll nach Datensätzen suchen können, um Produktionsaufträge, Artikel oder Arbeitsplänen schneller finden zu können; Die Suche soll im Nachhinein leicht erweiterbar bleiben; eine Volltextsuche ist nicht gefordert
