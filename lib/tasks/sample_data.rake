namespace :db do
  desc "Fill database with sample data"
  task :populate => :environment do
    Rake::Task['db:reset'].invoke
    Remember.create!(:name => 'railstutorial',
                 :tags => 'Ruby on rails, Tutorial',
                 :short_desc => 'online book on Ruby on Rails',
                 :full_desc => '',
                 :ref_name => 'http://russian.railstutorial.org/chapters/modeling-and-viewing-users-two',
                 :active => 'true',
                 :ref_type => 'Internet')
    99.times do |n|
      name  = Faker::Lorem.sentence
      tags = Faker::Lorem.sentence (word_count=5)
      short_desc = Faker::Lorem.paragraph (sentence_count=10)
      full_desc = Faker::Lorem.paragraphs (paragraph_count=10)
      ref_name = 'http://www.'+Faker::Internet.domain_name+'.'+Faker::Internet.domain_suffix
      active = 'true'
      ref_type = 'Internet'
      Remember.create!(:name => name, :tags => tags, :short_desc => short_desc,
                       :full_desc => full_desc, :ref_name => ref_name,
                       :active => active, :ref_type => ref_type)
    end
  end
end
