// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

import Rails from "@rails/ujs";
import Turbolinks from "turbolinks";
import * as ActiveStorage from "@rails/activestorage";
import "channels";


Rails.start();
Turbolinks.start();
ActiveStorage.start();

import { initCityCountry } from "../plugins/init_city&country";
import {initMapbox1} from "../plugins/restaurant_mapbox";
import {initMapbox} from "../plugins/init_mapbox";
import "bootstrap";
import jquery from 'jquery'
window.jQuery = jquery
window.$ = jquery

document.addEventListener("turbolinks:load", () => {
	$('.dropdown-toggle').dropdown();
	initMapbox1();
  initCityCountry();
  initMapbox();
});
