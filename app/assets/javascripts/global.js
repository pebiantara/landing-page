
function intervalDate(){
	arr = [$(".countdown-powerball"), $(".countdown-mega"), $(".countdown-lotto")];
	$.each(arr, function(i, el){
		string_date = $(el).data('date');
		end = new Date(string_date);
		_second = 1000;
		_minute = _second * 60;
		_hour = _minute * 60;
		_day = _hour * 24;  
  	showRemaining(_second, _minute, _hour, _day, end, el)
	});
}
function showRemaining(_second, _minute, _hour, _day, end, element) {
	now = new Date();
	console.log(end);
	console.log(now);
	distance = end - now;
	console.log(distance);
	if (distance < 0) {
		// clearInterval(timer);
		return;
	}
	days = Math.floor(distance / _day);
	hours = Math.floor((distance % _day) / _hour);
	minutes = Math.floor((distance % _hour) / _minute);
	seconds = Math.floor((distance % _minute) / _second);

	text_time = days + " days" + " " + hours + ":" + minutes + ":" + seconds;
	$(element).html(text_time);
}
setInterval(intervalDate, 1000);
