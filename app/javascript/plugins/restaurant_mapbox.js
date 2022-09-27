import mapboxgl from "mapbox-gl";
import MapboxWorker from "worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker";
import "mapbox-gl/dist/mapbox-gl.css";

const declareMap = (geocordinates, mapSpot, mapElement) => {
	mapSpot = new mapboxgl.Map({
		container: "map-spot",
		style: "mapbox://styles/cesar21456/ckufny7yg2pjl17pf3u56bc9e",
		center: geocordinates, // starting position
		zoom: 3, // starting zoo
	});
	mapSpot.on("idle", function () {
		mapSpot.resize();
	});
	const markers = JSON.parse(mapElement.dataset.markers);
	markers.forEach((marker) => {
		const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add thi
		new mapboxgl.Marker()
			.setLngLat([marker.lng, marker.lat])
			.setPopup(popup) // add this
			.addTo(mapSpot);
	});
};

const initMapbox1 = () => {
	let mapSpot;
	mapboxgl.workerClass = MapboxWorker;
	const mapElement = document.getElementById("map-spot");

	if (mapElement) {
		// only build a map if there's a div#map to inject into
		mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
		let geocordinates;
		navigator.geolocation.getCurrentPosition(
			function (position) {
				geocordinates = [position.coords.longitude, position.coords.latitude];
				declareMap(geocordinates, mapSpot, mapElement);
			},
			function () {
				declareMap([-60.00423624301569, -17.50841951602547], mapSpot, mapElement);
			}
		);
	}
};

export {initMapbox1};
