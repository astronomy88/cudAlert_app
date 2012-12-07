class AlertsController < ApplicationController
	before_filter :signed_in_user
	before_filter :connect_to_mongo, only: [:show, :show_wf]

	def show
	end

	def show_wf
	end

	def settings
		@triggers_spam = Alert.where(:product => "Spam")
		@triggers_wf   = Alert.where(:product => "Web Filter")
	end


	private

	    def signed_in_user
	      unless signed_in?
	        store_location
	        redirect_to signin_path, notice: "Please sign in." 
	      end
	    end 

	    def connect_to_mongo # and retrieves the records
	    	unless mongo_connected?
	    		@conn = Mongo::Connection.new('health.cudaops.com', 27017)

	    		db = @conn['User']
				alerts = db['Alerts'].find("related_note" => nil)
				@alerts_array = alerts.to_a

				@companies_array = Array.new
				@alerts_array.each do |alert|
					sn = alert['sn']
					db_wf = @conn['Health']
					@companies_array.push( db_wf['CudaInfo'].find_one("sn" => sn) )
				end
			end
	    end

end
