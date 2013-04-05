#create_table :unique_words do |t|
#  t.string :unique_word
#  t.string :unique_word_desc
#  t.string :language
#  t.string :word_type

#t.index :unique_word
#t.index :language
#t.index :word_type

#  t.timestamps

class UniqueWord < ActiveRecord::Base
  attr_accessible :language, :unique_word, :unique_word_desc, :word_type, :id
  
  has_many :WordVariations

  def PopulateUniqueWord()
    temp_name=""
    temp_type=""
    i=0
    UniqueWord.delete_all
    CSV.open('app/assets/files/lingvo/ru/Word_sense_list.csv', "r").each do |row|
      if temp_name<=>row[0]
        if row[1].match("t:noun")==nil
            temp_type = ''
          else
            temp_type='noun'
        end  
        UniqueWord.create(:unique_word => row[0].last(row[0].length-2),
                          :unique_word_desc => row[1],
                          :language => "ru",
                          :word_type =>temp_type)
      end
      i =i+1
#      break if i > 10
    end    
  end
end


