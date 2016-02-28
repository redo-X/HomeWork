FactoryGirl.define do
  factory :article do
    code '123'
    name 'Auto'
    version '1.0'
    article_group_id {[FactoryGirl.create(:article_group)]}
  end
end
