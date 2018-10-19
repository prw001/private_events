module ApplicationHelper

	def clean_up_date(date)
		date.gsub!(/[1-3]+\=\>/, '')
		date.gsub!(/[{},]/, '')
		convert_to_words(date.split)
	end

	private

		def convert_to_words(date)
			"#{date[1]} #{Date::MONTHNAMES[date[0].to_i]} #{date[2]}"
		end
end
