$(".dial1").knob();
$({animatedVal: 0}).animate({animatedVal: 95}, {
	duration: 10000,
	easing: "swing",
	step: function() {
		$(".dial1").val(Math.ceil(this.animatedVal)).trigger("change");
	}
});
$(".dial2").knob();
$({animatedVal: 0}).animate({animatedVal: 85}, {
	duration: 10000,
	easing: "swing",
	step: function() {
		$(".dial2").val(Math.ceil(this.animatedVal)).trigger("change");
	}
});
$(".dial3").knob();
$({animatedVal: 0}).animate({animatedVal: 90}, {
	duration: 10000,
	easing: "swing",
	step: function() {
		$(".dial3").val(Math.ceil(this.animatedVal)).trigger("change");
	}
});
$(".dial4").knob();
$({animatedVal: 0}).animate({animatedVal: 90}, {
	duration: 10000,
	easing: "swing",
	step: function() {
		$(".dial4").val(Math.ceil(this.animatedVal)).trigger("change");
	}
});
$(".dial5").knob();