global class MockCallout implements HttpCalloutMock {
    global HTTPResponse respond(HTTPRequest req) {
        VisualCrossingController.WeatherWrapper wrapper = new VisualCrossingController.WeatherWrapper();
        wrapper.resolvedAddress = 'Machado, MG, Brazil';
        VisualCrossingController.CurrentConditionWrapper wrapperChild = new VisualCrossingController.CurrentConditionWrapper();
		wrapperChild.datetimeEpoch = 1663772636;
		wrapperChild.temp = 28.9;
		wrapperChild.feelslike = 30.2;
		wrapperChild.humidity = 56.2;
		wrapperChild.dew = 19.3;
		wrapperChild.precip = 0.0;
		wrapperChild.precipprob = null;
		wrapperChild.snow = 0.0;
		wrapperChild.snowdepth = 0.0;
		wrapperChild.preciptype = null;
		wrapperChild.windgust = null;
		wrapperChild.windspeed = 10.1;
		wrapperChild.winddir = 323.0;
		wrapperChild.pressure = 1010.0;
		wrapperChild.visibility = null;
		wrapperChild.cloudcover = 96.4;
		wrapperChild.solarradiation = 937.0;
		wrapperChild.solarenergy = 3.4;
		wrapperChild.uvindex = 9.0;
		wrapperChild.conditions = 'Overcast';
		wrapperChild.icon = 'cloudy';
		wrapperChild.sunrise = '05:54:13';
		wrapperChild.sunriseEpoch = 1663750453;
		wrapperChild.sunset = '17:59:38';
		wrapperChild.sunsetEpoch = 1663793978;
		wrapperChild.moonphase = 0.91;
        wrapper.currentConditions = wrapperChild;
        HttpResponse res = new HttpResponse();
        res.setBody(JSON.serialize(wrapper));
        return res;


    }

}