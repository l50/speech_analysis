class SearchView < ActiveRecord::Base

  attr_accessor :base, :actual, :diacritic, :speaker, :native_language

  def results
    
    # results = SearchView.where("base LIKE ? OR actual LIKE ? OR diacritic LIKE ? OR SPEAKER_NAME LIKE ? OR native_language LIKE ?",
    #                             "#{@base}","#{@actual}", "#{@diacritic}", "#{@speaker}" , "#{@native_language}")
	@query =""
    
    if @query.eql?("") && !@diacritic.empty?
    	@query = "diacritic LIKE \'%#{@diacritic}%\'"
    end
    if @query.eql?("") && !@actual.empty?
    	@query = @query + "actual LIKE \'%#{@actual}%\'"
    end
    if !@query.eql?("") && !@actual.empty?
    	@query = @query + " AND actual LIKE \'%#{@actual}%\'"
    end
    if @query.eql?("") && !@base.empty?
    	@query = @query + "base LIKE \'%#{@base}%\'"
    end
    if !@query.eql?("") and !@base.empty?
    	@query = @query + " AND base LIKE \'#{@base}\'"
    end
    if @query.eql?("") && !@speaker.empty?
    	@query = @query + "SPEAKER_NAME LIKE \'%#{@speaker}%\'"
    end
    if !@query.eql?("") && !@speaker.empty?
    	@query = @query + " AND SPEAKER_NAME LIKE \'%#{@speaker}%'"
    end
    if @query.eql?("") && !@native_language.empty?
    	@query = @query + "native_language LIKE \'%#{@native_language}%\'"
    end
    if !@query.eql?("") && !@native_language.empty?
    	@query = @query + " AND native_language LIKE \'%#{@native_language}%\'"
    end
    if !@query.empty?
   		@flag ="n"
   		results = SearchView.where(@query)
    end
   end
end