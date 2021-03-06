FactoryGirl.define do
  factory :note do
    title { Faker::Book.title }
    body  { Faker::Hipster.paragraphs(6).join("\n\n") }

    transient do
      tag_count   5
    end

    factory :note_with_tags do
      after(:create) do |job, evaluator|
        evaluator.tag_count.times do
          job.tags << Tag.find_or_initialize_by(name: Faker::Company.buzzword.gsub(%r(\s), "_"))
        end
      end
    end
  end

end
