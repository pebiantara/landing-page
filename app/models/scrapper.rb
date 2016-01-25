class Scrapper
	attr_accessor :agent, :url

	def initialize
		@agent = Mechanize.new
		@url = "http://www.flalottery.com/"
	end

	def get_amount_lottery
		begin
			page = @agent.get(@url)
			contents = page.parser.css(".wnPlainBkgrd")
			results = {}
			contents.each do |content|
				text_content = Nokogiri::HTML::Document.parse(content.to_html)
				text_content.css('.wnPlainBkgrd').each do |c|
					amount = c.css(".wnNextJpAmt").first
					amount = amount ? c.css(".wnNextJpAmt").first.text : ""
					link = c.css('a').first['href']
					results[link.to_sym] = amount
				end
			end
			results
		rescue
			{:lotto => "$34 Million",
				:powerball => "$50 Million",
				:megaMillions => "$30 Million",
				:luckyMoney => "",
				:fantasy5 => "",
				:play4 => "",
				:cash3 => ""}
		end
	end
end