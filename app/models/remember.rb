#create_table :remembers do |t|
#  t.string :name
#  t.string :tags
#  t.text :short_desc
#  t.text :full_desc
#  t.string :ref_name
#  t.boolean :active
#  t.string :ref_type
#  t.timestamps
require 'csv'
      
class Remember < ActiveRecord::Base
  
  attr_accessible :active, :full_desc, :name, :ref_name, :ref_type, :short_desc, :tags, :tag_id

  belongs_to :Tag
  
  before_save :tagscreate

  

  def tagscreate()
    short_word_length=5
    tag_numbers=5


    a=full_desc.mb_chars.downcase.to_s+" "+short_desc.mb_chars.downcase.to_s
    a=a.split(" ")
    b=WordVariation.joins(:UniqueWord).where(:variation_word =>  a,
                                             :unique_words => {:word_type => 'noun' } ).map { |h| h.unique_word.mb_chars.downcase.to_s }
    b=b.select {|v| v.split("").count >= short_word_length }
    b=b.sort_by {|i| b.count(i) }.reverse.uniq.first(tag_numbers)
    self.tags=b.join(" ").to_s 
      
  end


end

  def WordVariationToCSV()
    imax=1000
    icnt=400000
    k=10
#    f=CSV.open('app/assets/files/lingvo/ru/WordsVariations.csv', "r").each do |row|
#      unless row.nil?
#        row.drop(row.count)  
#      end  
#    end

    f=CSV.open('app/assets/files/lingvo/ru/WordsVariations.csv', "ab")
 
    WordVariation.find_each(:start => icnt*(k-1), :conditions => "id < "+(icnt*k).to_s, :batch_size => imax) do |row| 
      f << row.attributes.values.first(5)
    end
    f.close

  end

  def UniqueWordToCSV()
    imax=100000
    i=0
    f=CSV.open('app/assets/files/lingvo/ru/UniqueWords.csv', "r").each do |row|
      unless row.nil?
        row.drop(row.count)  
      end  
    end
    f=CSV.open('app/assets/files/lingvo/ru/UniqueWords.csv', "wb")
    UniqueWord.first(imax).each do |row|
      f << row.attributes.values.first(4)
      i=i+1
    end  
    f.close

    return i.to_s
  end
  

  def AddIdOfUniqueWord()
    icnt=1
    imax=1
    ii=0
    s=Array.new(imax)
    icnt.times do |k|
      a=WordVariation.where("unique_word_id isnull").first(imax)
      if a.nil?
        break
      end
      
      imax.times {|j| s[j]=a[j].unique_word.mb_chars.downcase.to_s } #.force_encoding('ASCII-8BIT')
      b=UniqueWord.all(:conditions => { :unique_word => s })
      for i in 0..imax do
        if not a[i].nil?
          unless (b.nil? or b.find { |h| h['unique_word'] == a[i].unique_word.mb_chars.downcase.to_s }.nil?)
            j=b.find { |h| h['unique_word'] == a[i].unique_word.mb_chars.downcase.to_s }['id']
          else
            j='-1'
          end
          
          if not j.nil?
            a[i].unique_word_id=j
            a[i].save
            ii=ii+1
          end
        end  
      end
    end  
    
    return ii.to_s+ "  "+j.to_s #ss#.Encoding.default_internal#b.unique_word#a.unique_word+" + "+a.id.to_s+" + "+
  end