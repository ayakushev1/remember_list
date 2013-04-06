class Tag < ActiveRecord::Base
  attr_accessible :tag #, Remember_id
  
  belongs_to :Word_variation, :foreign_key => "word_variation"
  has_many :Remembers
  
end
