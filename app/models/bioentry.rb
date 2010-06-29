class Bioentry < ActiveRecord::Base
  belongs_to :biodatabase
  has_one :bioentry_record
  has_many :dbxrefs
  has_many :digeresults
  has_many :lcmsresults
  has_many :ingenuityresults
  has_many :goassignments
end
