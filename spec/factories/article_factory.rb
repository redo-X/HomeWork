FactoryGirl.define do
  factory :article do
    code '123'
    name 'Auto'
    version '1.0'
    #Artikelgruppe mit Code 500 ist immer festgelegt
    article_group { ArticleGroup.where('code=?', 500).first }
  end
end
