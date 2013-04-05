Factory.define :remember do |t|
      t.name 'railstutorial'
      t.tegs ['Ruby on rails', 'Tutorial']
      t.short_desc 'online book on Ruby on Rails'
      t.full_desc  ''
      t.ref_name 'http://russian.railstutorial.org/chapters/modeling-and-viewing-users-two'
      t.active Yes
      t.ref_type  'Internet'
end

