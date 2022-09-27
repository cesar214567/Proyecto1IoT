const initCityCountry = () => {


  const cities = document.getElementById("user_city");
  const countries = document.getElementById("user_country");
  if (countries) {
    countries.addEventListener("change", (event) => {
      cities.innerHTML = "";
      const actual_country = countries.options[countries.selectedIndex];
      fetch("https://countriesnow.space/api/v0.1/countries/cities", {
        method: "POST",
        body: JSON.stringify({ country: actual_country.text }),
        headers: {
          "X-Powered-By": "Express",
          "Access-Control-Allow-Origin": "*",
          "Access-Control-Allow-Headers": "*",
          "Content-Type": "application/json",
          "Content-Length": 858,
          ETag: "W/35a-V15oVpwHN0jBGP5cr5uJtRIWeW4",
          Date: Date.now(),
          Connection: "keep-alive",
        },
      })
        .then((response) => response.json())
        .then((response) => {
          response.data.forEach((element) => {
            cities.insertAdjacentHTML("beforeend", `<option value="${element}">${element}</option>`);
          });
        });
    });
  }
}

export {initCityCountry}
