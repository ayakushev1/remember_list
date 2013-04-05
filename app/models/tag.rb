class Tag < ActiveRecord::Base
  attr_accessible :tag, remember
  
  belongs_to :word_variation, :foreign_key => "word_variation"
  has_many :remembers
  
end
