$(function(){
	var input = document.getElementById('input');
	var picker = new Picker(input, {
	  format: 'YYYY-MM-DDTHH:mm',
	  container: '.js-mini-picker-container',
	  inline: true,
	  rows: 3,
	});
})