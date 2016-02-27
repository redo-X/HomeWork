# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

pass = "geheim"

admin = User.create email: 'admin@system.de',
                    password: pass,
                    password_confirmation: pass

user = User.create email: 'user@system.de',
                    password: pass,
                    password_confirmation: pass

admin.add_role :admin
user.add_role :user

puts "Admin password is #{pass}"
puts "User password is #{pass}"

agLeitungen = ArticleGroup.create code: 100, name: "Leitungen"
agWellrohre = ArticleGroup.create code: 200, name: "Wellrohre"
agMantelleitungen = ArticleGroup.create code: 300, name: "Mantelleitungen"
agStecker = ArticleGroup.create code: 400, name: "Stecker"
agKabelbaeume = ArticleGroup.create code: 500, name: "Kabelbäume"
agVerteiler = ArticleGroup.create code: 600, name: "Verteiler"
agSonstiges = ArticleGroup.create code: 700, name: "Sonstiges"



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

ws1 = WorkStep.create name: "Leitungen schneiden"
ws2 = WorkStep.create name: "Wellrohr schneiden"
ws3 = WorkStep.create name: "Vorsteckteile vorbereiten"
ws4 = WorkStep.create name: "Vorsteckteile anschlagen"
ws5 = WorkStep.create name: "Vorsteckteile endverarbeiten"
ws6 = WorkStep.create name: "Anschlagen"
ws7 = WorkStep.create name: "Formen"
ws8 = WorkStep.create name: "Prüfen"
ws9 = WorkStep.create name: "Dokumentieren"

standardWorkPlan = WorkPlan.create name: "Standard",
                                   description: "Fertigung nach dem Standard",
                                   is_standard: true
firstPieceWorkPlan = WorkPlan.create name: "Prototyp",
                                     description: "Fertigung für ein Prototyp",
                                     is_standard: false

standardWorkPlan.work_steps << ws1 << ws2 << ws3 << ws4 << ws5 << ws6 << ws7 << ws8
firstPieceWorkPlan.work_steps << ws1 << ws2 << ws3 << ws4 << ws5 << ws6 << ws7 << ws8 << ws9



=begin

=end
