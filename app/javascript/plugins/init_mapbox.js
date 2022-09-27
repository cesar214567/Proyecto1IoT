import mapboxgl from "mapbox-gl";
import MapboxWorker from "worker-loader!mapbox-gl/dist/mapbox-gl-csp-worker";

let map;
let currentMarker;
const initMapbox = () => {
	mapboxgl.workerClass = MapboxWorker;
	const mapElement = document.getElementById("map");

	if (mapElement) {
		// only build a map if there's a div#map to inject into
		mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
		map = new mapboxgl.Map({
			container: "map",
			style: "mapbox://styles/cesar21456/ckufny7yg2pjl17pf3u56bc9e",
			center: [-76.92412769923953, -12.046632676038357], // starting position
			zoom: 15, // starting zoom
		});
		map.on("click", (event) => {
			if (currentMarker != null) {
				currentMarker.remove();
			}
			const lat = document.getElementById("restaurant_latitude");
			const lon = document.getElementById("restaurant_longitude");
			const temp = event.lngLat.wrap();
			lat.value = temp["lat"];
			lon.value = temp["lng"];
			currentMarker = new mapboxgl.Marker().setLngLat([temp["lng"], temp["lat"]]).addTo(map);
		});
	}
};

export {initMapbox};
