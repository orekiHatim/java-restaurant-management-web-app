

function init(){
	var queryString = window.location.search.substring(1);
  const urlParams = new URLSearchParams(queryString);
  const lat = Number(urlParams.get('lat'))
  const lon = Number(urlParams.get('lon'))
	var map = L.map('map').setView([lat, lon], 13);

L.tileLayer('https://tile.openstreetmap.org/{z}/{x}/{y}.png', {
    maxZoom: 19,
    attribution: '&copy; <a href="http://www.openstreetmap.org/copyright">OpenStreetMap</a>'
}).addTo(map);
var marker = L.marker([lat, lon]).addTo(map);
}

function showMap(){
	//const map = document.querySelector('#map')
}
