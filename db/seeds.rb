# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pass = "geheim"

admin = User.create email: 'admin@system.de',
                    first_name: 'Admin',
                    last_name: 'Admin',
                    password: pass,
                    password_confirmation: pass

user1 = User.create email: 'user@system.de',
                    first_name: 'User',
                    last_name: 'User',
                    password: pass,
                    password_confirmation: pass
user2 = User.create email: 'dmelcher@system.de',
                    first_name: 'David',
                    last_name: 'Melcher',
                    password: pass,
                    password_confirmation: pass
user3 = User.create email: 'mehmen@system.de',
                    first_name: 'Michel',
                    last_name: 'Ehmen',
                    password: pass,
                    password_confirmation: pass
user4 = User.create email: 'mitarbeiter@system.de',
                    first_name: 'Mitarbeiter',
                    last_name: 'Mitarbeiter',
                    password: pass,
                    password_confirmation: pass

admin.add_role :admin
user2.add_role :admin
user3.add_role :admin

user1.add_role :user
user4.add_role :user

puts "Admin password is #{pass}"
puts "User1-4 password is #{pass}"


agLeitungen = ArticleGroup.create code: 100, name: "Leitungen"
agWellrohre = ArticleGroup.create code: 200, name: "Wellrohre"
agMantelleitungen = ArticleGroup.create code: 300, name: "Mantelleitungen"
agStecker = ArticleGroup.create code: 400, name: "Stecker"
agKabelbaeume = ArticleGroup.create code: 500, name: "Kabelbäume"
agVerteiler = ArticleGroup.create code: 600, name: "Verteiler"
agSonstiges = ArticleGroup.create code: 700, name: "Sonstiges"


Article.create code: 1110906,
               name: "FLRY-A 0,5 mm gn",
               version: 1,
               article_group: agLeitungen
Article.create code: 1110907,
               name: "FLRY-A 0,5 mm gr",
               version: 1,
               article_group: agLeitungen
Article.create code: 1110908,
               name: "FLRY-A 0,5 mm br",
               version: 1,
               article_group: agLeitungen
Article.create code: 1110909,
               name: "FLRY-A 0,5 mm ws",
               version: 1,
               article_group: agLeitungen
Article.create code: 1110910,
               name: "FLRY-A 0,5 mm rs",
               version: 1,
               article_group: agLeitungen

Article.create code: 9817032,
               name: "13-8,5-13 Y-VERTEILER",
               version: 1,
               article_group: agVerteiler
Article.create code: 9817033,
               name: "17-10-10 Y-VERTEILER",
               version: 1,
               article_group: agVerteiler


Article.create code: 7807270,
               name: "EINLEGERED.F.WELLR. NW 8,5/4,5/",
               version: 1,
               article_group: agWellrohre
Article.create code: 7807272,
               name: "EINLEGERED.F.WELLR. NW 10/4,5/",
               version: 1,
               article_group: agWellrohre
Article.create code: 7807276,
               name: "EINLEGERED.F.WELLR. NW 10/7,5/",
               version: 1,
               article_group: agWellrohre


Article.create code: 11637,
               name: "Helu OZ-500 BLACK 5x0,75qmm",
               version: 1,
               article_group: agMantelleitungen
Article.create code: 11638,
               name: "Helu OZ-500 BLACK 7x0,75qmm",
               version: 1,
               article_group: agMantelleitungen


Article.create code: 3024311,
               name: "Stecker 31-p Bu HDP20 KPL",
               version: 1,
               article_group: agStecker
Article.create code: 3024312,
               name: "Stecker 31-p Bu HDP20 KPL",
               version: 1,
               article_group: agStecker


kabelbaum1 = Article.create code: 200846572,
               name: "KB Ultraschallsensor Ultima",
               version: 3,
               article_group: agKabelbaeume
kabelbaum2 = Article.create code: 200846610,
               name: "KB Beleuchtung 6000mm",
               version: 5,
               article_group: agKabelbaeume
kabelbaum3 = Article.create code: 20297959,
               name: "ELS Spannungsversorgung DALI",
               version: 1,
               article_group: agKabelbaeume
Article.create code: 20297960,
               name: "ELS Erdung / H07V-U 1,50≤ 500 mm FLSTH 6,3",
               version: 2,
               article_group: agKabelbaeume
Article.create code: 20306685,
               name: "ELS Durchverdrahtung DALI/dimm 7polig",
               version: 1,
               article_group: agKabelbaeume
Article.create code: 3033622,
               name: "Kabelbaum Federentlastung",
               version: 1,
               article_group: agKabelbaeume
kabelbaum4 = Article.create code: 3033674,
               name: "K-Baum Schneidwerk 8-Reiher",
               version: 1,
               article_group: agKabelbaeume


Article.create code: 44429323,
               name: "EPIC LS1.5 Buchsenkontakt D BCEM 2MM AU 0,75-1,5 Kontakte",
               version: 1,
               article_group: agSonstiges
Article.create code: 44429336,
               name: "EPIC LS1.5 Stiftkontakt A SCEM 3,6MM AU 1,0-4,0 Kontakte",
               version: 1,
               article_group: agSonstiges
Article.create code: 44429341,
               name: "EPIC LS1.5 Stiftkontakt A SCEM 2MM AU 0,75-1,5 Kontakte",
               version: 1,
               article_group: agSonstiges


cKrone = Customer.create code: 7000,
                name1: "Krone Landtechnik",
                phone: "05943-12345-0",
                fax: "05943-12345-1",
                mail: "info@krone.de",
                web: "http://www.krone.de",
                contactperson: "Fiete Fietersen"

cClaas = Customer.create code: 7001,
                name1: "Claas",
                phone: "05940-215-0",
                fax: "05940-215-1",
                mail: "info@claas.de",
                web: "http://www.claas.de",
                contactperson: "Peter Petersen"

standardWorkPlan = WorkPlan.create name: "Standard",
                                   description: "Fertigung nach dem Standard",
                                   is_standard: true
firstPieceWorkPlan = WorkPlan.create name: "Prototyp",
                                     description: "Fertigung für ein Prototyp",
                                     is_standard: false

ws1 = WorkStep.create name: "Leitungen schneiden"
ws2 = WorkStep.create name: "Wellrohr schneiden"
ws3 = WorkStep.create name: "Vorsteckteile vorbereiten"
ws4 = WorkStep.create name: "Vorsteckteile anschlagen"
ws5 = WorkStep.create name: "Vorsteckteile endverarbeiten"
ws6 = WorkStep.create name: "Anschlagen"
ws7 = WorkStep.create name: "Formen"
ws8 = WorkStep.create name: "Prüfen"

standardWorkPlan.work_steps << ws1 << ws2 << ws3 << ws4 << ws5 << ws6 << ws7 << ws8

ws1 = WorkStep.create name: "Leitungen schneiden"
ws2 = WorkStep.create name: "Wellrohr schneiden"
ws3 = WorkStep.create name: "Vorsteckteile vorbereiten"
ws4 = WorkStep.create name: "Vorsteckteile anschlagen"
ws5 = WorkStep.create name: "Vorsteckteile endverarbeiten"
ws6 = WorkStep.create name: "Anschlagen"
ws7 = WorkStep.create name: "Formen"
ws8 = WorkStep.create name: "Prüfen"
ws9 = WorkStep.create name: "Dokumentieren"

firstPieceWorkPlan.work_steps << ws1 << ws2 << ws3 << ws4 << ws5 << ws6 << ws7 << ws8 << ws9


po1 = ProductionOrder.create number: 90030010,
                             description: "Prototypfertigung",
                             quantity: 1,
                             pending_quantity: 1,
                             release_date: Date.parse("20.02.2016"),
                             due_date: Date.parse("30.05.2016"),
                             customer: cKrone,
                             article_id: kabelbaum3.id,
                             work_plan: firstPieceWorkPlan

po2 = ProductionOrder.create number: 90030011,
                             description: "Normalfertigung",
                             quantity: 25,
                             pending_quantity: 25,
                             release_date: Date.parse("21.02.2016"),
                             due_date: Date.parse("20.05.2016"),
                             customer: cKrone,
                             article_id: kabelbaum1.id,
                             work_plan: standardWorkPlan

po3 = ProductionOrder.create number: 90030012,
                             description: "Normalfertigung",
                             quantity: 50,
                             pending_quantity: 50,
                             release_date: Date.parse("21.02.2016"),
                             due_date: Date.parse("18.05.2016"),
                             customer: cClaas,
                             article_id: kabelbaum4.id,
                             work_plan: standardWorkPlan

po1.set_work_plan(firstPieceWorkPlan)
po2.set_work_plan(standardWorkPlan)
po3.set_work_plan(standardWorkPlan)


