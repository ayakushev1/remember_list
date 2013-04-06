class Tag < ActiveRecord::Base
  attr_accessible :tag, remember
  
  belongs_to :Word_variation, :foreign_key => "word_variation"
  has_many :Remembers
  
end
