
function intervalDate(){
	arr = [$(".countdown-powerball"), $(".countdown-mega"), $(".countdown-lotto")];
	$.each(arr, function(i, el){
		string_date = $(el).data('date');
		// end = new Date(string_date);
	  format = 'YYYY/MM/DD HH:mm:ss ZZ';
		end = moment(string_date).zone(string_date);
		_second = 1000;
		_minute = _second * 60;
		_hour = _minute * 60;
		_day = _hour * 24;  
		showRemaining(_second, _minute, _hour, _day, end, el);
		// console.log(convertTime(end, 'EST'))
	});
}

function showRemaining(_second, _minute, _hour, _day, end, element) {
	now = new Date();
	distance = end - now;
	if (distance < 0) {
		// clearInterval(timer);
		return;
	}
	days = Math.floor(distance / _day);
	hours = Math.floor((distance % _day) / _hour);
	minutes = Math.floor((distance % _hour) / _minute);
	seconds = Math.floor((distance % _minute) / _second);
	days_info = days > 1 ? 'days' : 'day'
	text_days = days > 0 ? (days + " " + days_info + " ") : '' 
	text_time = text_days + hours + ":" + minutes + ":" + seconds;
	$(element).html(text_time);
}
setInterval(intervalDate, 1000);
