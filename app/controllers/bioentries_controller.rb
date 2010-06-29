class BioentriesController < ApplicationController
  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  verify :method => :post, :only => [ :destroy, :create, :update ],
  :redirect_to => { :action => :list }

  def list
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30,
    :conditions => ["biodatabase_id = 2"]
  end

  def dige_entries
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30, 
    :conditions => ["bioentries.biodatabase_id = 2 and digeresults.bioentry_id = bioentries.id"],
    :include => :digeresults
    render :template => "bioentries/list"
  end

  def lcms_entries
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30, 
    :conditions => ["bioentries.biodatabase_id = 2 and lcmsresults.bioentry_id = bioentries.id"],
    :include => :lcmsresults
    render :template => "bioentries/list"
  end

  def gofunc_entries
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30, 
    :conditions => ["bioentries.biodatabase_id = 2 and goassignments.bioentry_id = bioentries.id"],
    :include => :goassignments
    render :template => "bioentries/list"
  end

  def ingenuity_entries
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30, 
    :conditions => ["bioentries.biodatabase_id = 2 and ingenuityresults.bioentry_id = bioentries.id"],
    :include => :ingenuityresults
    render :template => "bioentries/list"
  end

  def show
    @bioentry = Bioentry.find(params[:id])
  end

  # Non-scaffold methods
  def keywords
    @bioentry_pages, @bioentries = paginate :bioentries, :per_page => 30, 
    :conditions => ["biodatabase_id = 2 and match (bioentry_records.record) against ( ?  IN BOOLEAN MODE)", params[:kw]],
    :include => :bioentry_record
    render :template => "bioentries/list"
  end
end
