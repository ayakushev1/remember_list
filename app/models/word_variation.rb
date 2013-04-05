# encoding: utf-8
#create_table :word_variations do |t|
#      t.string :variation_word
#      t.string :unique_word
#      t.string :variation_word_desc
#      t.references :unique_word
#      
#      t.timestamps
#    end
#      
#    add_index :word_variations, :variation_word
#    add_index :word_variations, :unique_word
#    add_index :word_variations, :unique_word_id
      
class WordVariation < ActiveRecord::Base

  attr_accessible :variation_word, :variation_word_desc, :unique_word, :unique_word_id
  
  belongs_to :UniqueWord, :foreign_key => "unique_word_id"
  has_many :Tags
  
  def self.downcase()
    mb_chars.downcase.to_s
  end

end


  def PopulateVariationWord(tags)
    i=0
    imax=200000
    idmin=300784 #WordVariation.find_by_id (:first)
    idmax=tags.to_i #idmin+1001 #WordVariation.find_by_id (:last)
    
#    WordVariation.delete_all
  
    CSV.open('app/assets/files/lingvo/ru/Word_sense_variation_list.csv', "r").each do |row|
      if i>=(idmax-idmin)     
        WordVariation.create(:variation_word => row[0],
                          :unique_word => row[1],
                          :variation_word_desc => row[2])
      end
      i =i+1
      break if (i >= (imax+idmax-idmin))
    end
    return (idmax+imax).to_s
  end