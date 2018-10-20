module ApplicationHelper

	def clean_up_date(date)
		date.gsub!(/[1-3]+\=\>/, '')
		date.gsub!(/[{},]/, '')
		convert_to_words(date.split)
	end

	def month_name_to_num(month)
  		case month
  		when "January"
  			1
  		when "February"
  			2
  		when "March"
  			3
  		when "April"
  			4
  		when "May"
  			5
  		when "June"
  			6
  		when "July"
  			7
  		when "August"
  			8
  		when "September"
  			9
  		when "October"
  			10
  		when "November"
  			11
  		when "December"
  			12
  		else
  			0
  		end
  	end

  	def get_time(date)
  		Time.mktime(date[2].to_i,
  					month_name_to_num(date[1]),
  					date[0].to_i)
  	end

	private

		def convert_to_words(date)
			"#{date[1]} #{Date::MONTHNAMES[date[0].to_i]} #{date[2]}"
		end
end
