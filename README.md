#PROJEKTBESCHREIBUNG

Das Projekt ist ein reales Projekt der Firma rokatec Kabelkonfektion GmbH, wo ich (David Melcher)
seit zwei Jahren als Anwendungsentwickler arbeite.
Für die Dokumentation existiert in der Firma eine Betriebsdatenerfassung, die von den Mitarbeitern mit Daten gefüllt wird.
Dort werden Meilensteine der Produktion Produktionsauftragsabhängig dokumentiert.
Vor ein paar Wochen wurde entschieden, dass Mitarbeiter bzw. Aushilfskräfte auch bestimmte Arbeitsschritte Zuhause ausführen können.
Damit auch diese Arbeitszeit bzw. Meilensteine dokumentiert werden, haben wir uns entschieden, das Web-Projekt dafür zu nutzen, um der Firma einen Prototyp zu entwickeln.
Der Prototyp wurde unabhängig von der IT-Applikationslandschaft entwickelt,
um eine Benotung und unabhängiges Verwenden der Anwendung zu ermöglichen.
In der Zukunft wird das Projekt noch in die Applikationslandschaft integriert und erhält Schnittstellen zu den bestehenden Systemen,
sodass die Datenbereitstellung für das Web-Portal automatisiert erfolgt.


#KERNFUNKTION DES PROJEKTS
Die Kernfunktion bildet die Dokumentation der Arbeitszeit, die ein Mitarbeiter an einem Produktionsauftrag arbeitet.
Um den Mitarbeitern die Erfassung zu erleichtern, hat jeder Produktionsauftrag Anhänge (Dokumente für die Produktion [Stücklisten, Zeichnungen, ...]),
einen Arbeitsplan, usw., welche zusätzlich durch einen Assistenten durchgeführt wird.

### WICHTIG: Wir dürfen leider nicht die Dokumente öffentlich hochladen, weil wir verpflichtet sind, die Geheimhaltung der Kunden zu wahren.

#USER-STORIES
*   Backend und Frontend sollen durch eine Anmeldung getrennt werden
*   Jeder Benutzer hat eine Rolle (Administrator oder Nutzer)
*   Mitarbeiter der Verwaltung bekommen die Rolle Administrator und die ausführenden Kräfte die Rolle Nutzer zugewiesen


##FRONTEND
*   Der Mitarbeiter soll sich von Zuhause aus mit vorgegebenen Anmeldeinformationen in das Web-Portal anmelden können
*   Der Mitarbeiter soll seine Produktionsbuchungen sich ansehen können
*   Der Mitarbeiter soll in der Lage sein, seine Arbeitszeit möglichst einfach im Portal erfassen zu können
    *   Eine weitere Erleichterung soll sein, dass eine Start-Buchung und eine Ende-Buchung erfolgt, sodass der Mitarbeiter nicht selber etwas aufschreiben muss


##BACKEND
*   Der Mitarbeiter soll Kunden anlegen, aktualisieren und entfernen können
*   Der Mitarbeiter soll Artikelgruppen anlegen, aktualisieren und entfernen können
*   Der Mitarbeiter soll Artikel anlegen, aktualisieren und entfernen können
    *   Der Mitarbeiter soll einem Artikel eine Artikelgruppe zuordnen können
*   Der Mitarbeiter soll ein Arbeitsplan anlegen, aktualisieren und entfernen können
    *   Der Mitarbeiter soll einem Arbeitsplan, Arbeitsschritte zuordnen können, die vorgeben, was der Mitarbeiter an Arbeitszeit dokumentieren kann
*   Der Mitarbeiter soll Produktionsaufträge (PA) anlegen, aktualisieren und entfernen können
    *   Der Mitarbeiter soll einem PA eine Arbeitsvorlage zuordnen können. Mit der Zuordnung, werden alle Arbeitsschritte in den PA kopiert, sodass der Mitarbeiter in Beziehung zu den kopierten Arbeitsschritten Buchungen vornehmen kann
    *   Der Mitarbeiter soll einem PA den zu fertigenden Artikel zuordnen können
    *   Der Mitarbeiter soll einem PA den Auftraggeber (Kunde) zuordnen können
    *   Der Mitarbeiter soll einem PA Anhänge zuordnen können, die dem Mitarbeiter bei der Produktion unterstützende Informationen liefern
    *   Der Mitarbeiter soll einem PA die Arbeitsschritte auch manuell hinzufügen und entfernen können
    *   Der Mitarbeiter soll die Buchungen, die bereits in einem PA eingegangen sind, sehen können und dessen Gesamtzeit einsehen können
    *   Der Mitarbeiter soll nach Datensätzen suchen können, um Produktionsaufträge, Artikel oder Arbeitsplänen schneller finden zu können; Die Suche soll im Nachhinein leicht erweiterbar bleiben; eine Volltextsuche ist nicht gefordert


#Benutzen der Anwendung
##Link zur Anwendung
[Klick](https://arcane-mesa-34252.herokuapp.com)
##Mitarbeiter im Backoffice
*   Anmelden als "Administrator" (admin@system.de, ...) siehe seeds.rb
*   In der Navigation Verwalten->XXX können die Listen aufgerufen werden, um CRUD-Funktionalitäten durchzuführen
*   Die Listen sind immer gleich aufgebaut
    *   Der Stift öffnet die Bearbeitungsansicht
    *   Die Mülltonne entfernt das Element
    *   Manche Elemente haben zusätzlich zu er Bearbeiten-Ansicht eine normale "Read-Only"-Ansicht, welche mittels Mausklick auf die Nummer geöffnet wird

##Mitarbeiter als ausführende Kraft
*   Anmelden als "Nutzer" (dmelcher@system.de, mehmen@system.de, user@system.de) siehe seeds.rb
*   In der Navigation werden zwei Links angezeigt "Arbeit beginnen/Arbeit beenden" und "Meine Produktionsbuchungen"
    *   Der Link "Arbeit beginnen" führt den Nutzer in den Assistenten, um den Buchungssatz anzulegen
    *   Um die Arbeit zu beenden, muss der Nutzer den Link "Arbeit beenden" betätigen. (Hinweis: die Links wechseln sich ab)
    *   Um die bereits erledigten Buchungen einzusehen, kann der Nutzer auf den Link "Meine Produktionsbuchungen" klicken

# Komponenten mit Version
GEM
  remote: https://rubygems.org/
  specs:
    actionmailer (4.2.5)
      actionpack (= 4.2.5)
      actionview (= 4.2.5)
      activejob (= 4.2.5)
      mail (~> 2.5, >= 2.5.4)
      rails-dom-testing (~> 1.0, >= 1.0.5)
    actionpack (4.2.5)
      actionview (= 4.2.5)
      activesupport (= 4.2.5)
      rack (~> 1.6)
      rack-test (~> 0.6.2)
      rails-dom-testing (~> 1.0, >= 1.0.5)
      rails-html-sanitizer (~> 1.0, >= 1.0.2)
    actionview (4.2.5)
      activesupport (= 4.2.5)
      builder (~> 3.1)
      erubis (~> 2.7.0)
      rails-dom-testing (~> 1.0, >= 1.0.5)
      rails-html-sanitizer (~> 1.0, >= 1.0.2)
    activejob (4.2.5)
      activesupport (= 4.2.5)
      globalid (>= 0.3.0)
    activemodel (4.2.5)
      activesupport (= 4.2.5)
      builder (~> 3.1)
    activerecord (4.2.5)
      activemodel (= 4.2.5)
      activesupport (= 4.2.5)
      arel (~> 6.0)
    activesupport (4.2.5)
      i18n (~> 0.7)
      json (~> 1.7, >= 1.7.7)
      minitest (~> 5.1)
      thread_safe (~> 0.3, >= 0.3.4)
      tzinfo (~> 1.1)
    addressable (2.4.0)
    arel (6.0.3)
    bcrypt (3.1.10)
    binding_of_caller (0.7.2)
      debug_inspector (>= 0.0.1)
    bootstrap-datepicker-rails (1.5.0)
      railties (>= 3.0)
    bootstrap3-datetimepicker-rails (4.17.37)
      momentjs-rails (>= 2.8.1)
    builder (3.2.2)
    byebug (8.2.2)
    cancan (1.6.10)
    capybara (2.6.2)
      addressable
      mime-types (>= 1.16)
      nokogiri (>= 1.3.3)
      rack (>= 1.0.0)
      rack-test (>= 0.5.4)
      xpath (~> 2.0)
    carrierwave (0.10.0)
      activemodel (>= 3.2.0)
      activesupport (>= 3.2.0)
      json (>= 1.7)
      mime-types (>= 1.16)
    coderay (1.1.1)
    coffee-rails (4.1.1)
      coffee-script (>= 2.2.0)
      railties (>= 4.0.0, < 5.1.x)
    coffee-script (2.4.1)
      coffee-script-source
      execjs
    coffee-script-source (1.10.0)
    commonjs (0.2.7)
    debug_inspector (0.0.2)
    devise (3.5.3)
      bcrypt (~> 3.0)
      orm_adapter (~> 0.1)
      railties (>= 3.2.6, < 5)
      responders
      thread_safe (~> 0.1)
      warden (~> 1.2.3)
    devise-bootstrap-views (0.0.7)
    diff-lcs (1.2.5)
    erubis (2.7.0)
    execjs (2.6.0)
    factory_girl (4.5.0)
      activesupport (>= 3.0.0)
    factory_girl_rails (4.6.0)
      factory_girl (~> 4.5.0)
      railties (>= 3.0.0)
    ffi (1.9.10)
    formatador (0.2.5)
    globalid (0.3.6)
      activesupport (>= 4.1.0)
    guard (2.13.0)
      formatador (>= 0.2.4)
      listen (>= 2.7, <= 4.0)
      lumberjack (~> 1.0)
      nenv (~> 0.1)
      notiffany (~> 0.0)
      pry (>= 0.9.12)
      shellany (~> 0.0)
      thor (>= 0.18.1)
    guard-compat (1.2.1)
    guard-rspec (4.6.4)
      guard (~> 2.1)
      guard-compat (~> 1.1)
      rspec (>= 2.99.0, < 4.0)
    hike (1.2.3)
    i18n (0.7.0)
    jbuilder (2.4.1)
      activesupport (>= 3.0.0, < 5.1)
      multi_json (~> 1.2)
    jquery-rails (4.1.0)
      rails-dom-testing (~> 1.0)
      railties (>= 4.2.0)
      thor (>= 0.14, < 2.0)
    json (1.8.3)
    less (2.6.0)
      commonjs (~> 0.2.7)
    less-rails (2.7.1)
      actionpack (>= 4.0)
      less (~> 2.6.0)
      sprockets (> 2, < 4)
      tilt
    libv8 (3.16.14.13)
    listen (3.0.6)
      rb-fsevent (>= 0.9.3)
      rb-inotify (>= 0.9.7)
    loofah (2.0.3)
      nokogiri (>= 1.5.9)
    lumberjack (1.0.10)
    mail (2.6.3)
      mime-types (>= 1.16, < 3)
    method_source (0.8.2)
    mime-types (2.99)
    mini_portile2 (2.0.0)
    minitest (5.8.4)
    momentjs-rails (2.11.0)
      railties (>= 3.1)
    multi_json (1.11.2)
    nenv (0.3.0)
    nokogiri (1.6.7.2)
      mini_portile2 (~> 2.0.0.rc2)
    notiffany (0.0.8)
      nenv (~> 0.1)
      shellany (~> 0.0)
    orm_adapter (0.5.0)
    pg (0.18.4)
    pry (0.10.3)
      coderay (~> 1.1.0)
      method_source (~> 0.8.1)
      slop (~> 3.4)
    rack (1.6.4)
    rack-test (0.6.3)
      rack (>= 1.0)
    rails (4.2.5)
      actionmailer (= 4.2.5)
      actionpack (= 4.2.5)
      actionview (= 4.2.5)
      activejob (= 4.2.5)
      activemodel (= 4.2.5)
      activerecord (= 4.2.5)
      activesupport (= 4.2.5)
      bundler (>= 1.3.0, < 2.0)
      railties (= 4.2.5)
      sprockets-rails
    rails-deprecated_sanitizer (1.0.3)
      activesupport (>= 4.2.0.alpha)
    rails-dom-testing (1.0.7)
      activesupport (>= 4.2.0.beta, < 5.0)
      nokogiri (~> 1.6.0)
      rails-deprecated_sanitizer (>= 1.0.1)
    rails-html-sanitizer (1.0.3)
      loofah (~> 2.0)
    rails_12factor (0.0.3)
      rails_serve_static_assets
      rails_stdout_logging
    rails_serve_static_assets (0.0.5)
    rails_stdout_logging (0.0.4)
    railties (4.2.5)
      actionpack (= 4.2.5)
      activesupport (= 4.2.5)
      rake (>= 0.8.7)
      thor (>= 0.18.1, < 2.0)
    rake (10.5.0)
    rb-fsevent (0.9.7)
    rb-inotify (0.9.7)
      ffi (>= 0.5.0)
    rdoc (4.2.2)
      json (~> 1.4)
    ref (2.0.0)
    responders (2.1.1)
      railties (>= 4.2.0, < 5.1)
    rolify (5.0.0)
    rspec (3.4.0)
      rspec-core (~> 3.4.0)
      rspec-expectations (~> 3.4.0)
      rspec-mocks (~> 3.4.0)
    rspec-core (3.4.3)
      rspec-support (~> 3.4.0)
    rspec-expectations (3.4.0)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.4.0)
    rspec-mocks (3.4.1)
      diff-lcs (>= 1.2.0, < 2.0)
      rspec-support (~> 3.4.0)
    rspec-rails (3.4.2)
      actionpack (>= 3.0, < 4.3)
      activesupport (>= 3.0, < 4.3)
      railties (>= 3.0, < 4.3)
      rspec-core (~> 3.4.0)
      rspec-expectations (~> 3.4.0)
      rspec-mocks (~> 3.4.0)
      rspec-support (~> 3.4.0)
    rspec-support (3.4.1)
    sass (3.2.19)
    sass-rails (4.0.5)
      railties (>= 4.0.0, < 5.0)
      sass (~> 3.2.2)
      sprockets (~> 2.8, < 3.0)
      sprockets-rails (~> 2.0)
    sdoc (0.4.1)
      json (~> 1.7, >= 1.7.7)
      rdoc (~> 4.0)
    shellany (0.0.1)
    slop (3.6.0)
    spring (1.6.3)
    sprockets (2.12.4)
      hike (~> 1.2)
      multi_json (~> 1.0)
      rack (~> 1.0)
      tilt (~> 1.1, != 1.3.0)
    sprockets-rails (2.3.3)
      actionpack (>= 3.0)
      activesupport (>= 3.0)
      sprockets (>= 2.8, < 4.0)
    sqlite3 (1.3.11)
    therubyracer (0.12.2)
      libv8 (~> 3.16.14.0)
      ref
    thor (0.19.1)
    thread_safe (0.3.5)
    tilt (1.4.1)
    time_difference (0.4.2)
      activesupport
    turbolinks (2.5.3)
      coffee-rails
    twitter-bootstrap-rails (3.2.2)
      actionpack (>= 3.1)
      execjs (>= 2.2.2, >= 2.2)
      less-rails (>= 2.5.0)
      railties (>= 3.1)
    tzinfo (1.2.2)
      thread_safe (~> 0.1)
    uglifier (2.7.2)
      execjs (>= 0.3.0)
      json (>= 1.8.0)
    warden (1.2.4)
      rack (>= 1.0)
    web-console (2.3.0)
      activemodel (>= 4.0)
      binding_of_caller (>= 0.7.2)
      railties (>= 4.0)
      sprockets-rails (>= 2.0, < 4.0)
    xpath (2.0.0)
      nokogiri (~> 1.3)

PLATFORMS
  ruby

DEPENDENCIES
  bootstrap-datepicker-rails
  bootstrap3-datetimepicker-rails (~> 4.17.37)
  byebug
  cancan
  capybara
  carrierwave
  coffee-rails (~> 4.1.0)
  devise
  devise-bootstrap-views
  factory_girl_rails
  guard-rspec
  i18n (~> 0.7.0)
  jbuilder (~> 2.0)
  jquery-rails
  less-rails
  momentjs-rails (>= 2.9.0)
  pg
  rails (= 4.2.5)
  rails_12factor
  rolify
  rspec-rails
  sass-rails (~> 4.0.0)
  sdoc (~> 0.4.0)
  spring
  sqlite3
  therubyracer
  time_difference (~> 0.4.2)
  turbolinks
  twitter-bootstrap-rails
  uglifier (>= 1.3.0)
  web-console (~> 2.0)

BUNDLED WITH
   1.11.2

