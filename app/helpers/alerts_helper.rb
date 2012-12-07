module AlertsHelper

	# def update_to_p1(alert)
	# 	alert.priority = 1
	# 	save

	# end

	def mongo_connected?
		!@conn.nil?
	end


end
