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
          
          next_jp = c.css(".wnNextDate").first
          next_jp = next_jp ? c.css(".wnNextDate").first.text : ""
          link = c.css('a').first['href']
					results[link.to_sym] = {amount: amount, date: next_jp}
				end
			end
			results
		rescue
			{:lotto => {amount: "$34 Million", date: "-"},
				:powerball => {amount: "$50 Million", date: ""},
				:megaMillions => {amount: "$30 Million", date: ""},
				:luckyMoney => {amount: "", date: ""},
				:fantasy5 => {amount: "", date: ""},
				:play4 => {amount: "", date: ""},
				:cash3 => {amount: "", date: ""}}
		end
	end
end