({
    handleKeyUp: function (cmp, evt) {
        var isEnterKey = evt.keyCode === 13;
        var queryTerm = cmp.find('enter-search').get('v.value');
        if (isEnterKey) {
            
            cmp.set('v.location', queryTerm);
            cmp.set('v.issearching', true);
            
            /*
            setTimeout(function() {
                alert('Searched for "' + queryTerm + '"!');
                cmp.set('v.issearching', false);
            }, 2000);*/
            
            var action = cmp.get("c.getWeatherByLocation");
            
            
            action.setParams({ location : cmp.get("v.location") });
    
            action.setCallback(this, function(response) {
                
                var state = response.getState();
                
                console.log(state)
                if (state === "SUCCESS") {
                    cmp.set('v.resolvedAddress', response.getReturnValue().resolvedAddress)
                    var responseData =  response.getReturnValue().currentConditions
                
                    console.log(responseData)
                    cmp.set('v.temp', responseData['temp'])
                    cmp.set('v.feelslike', responseData['feelslike'])
                    cmp.set('v.humidity', responseData['humidity'])
                    cmp.set('v.dew', responseData['dew'])
                    cmp.set('v.precip', responseData['precip'])
                    cmp.set('v.precipprob', responseData['precipprob'] ?responseData['precipprob'] : 0 )
                    cmp.set('v.snow', responseData['snow'])
                    cmp.set('v.snowdepth', responseData['snowdepth'])
                    cmp.set('v.preciptype', responseData['preciptype'] ? responseData['preciptype'] : 'N/A')
                    cmp.set('v.windgust', responseData['windgust'] ? responseData['windgust'] : 'Not relevant')
                    cmp.set('v.windspeed', responseData['windspeed'])
                    cmp.set('v.winddir', responseData['winddir'])
                    cmp.set('v.pressure', responseData['pressure'])
                    cmp.set('v.visibility', responseData['visibility'] ? responseData['visibility'] : 'N/A')
                    cmp.set('v.cloudcover', responseData['cloudcover'])
                    cmp.set('v.solarradiation', responseData['solarradiation'])
                    cmp.set('v.solarenergy', responseData['solarenergy'])
                    cmp.set('v.uvindex', responseData['uvindex'])
                    cmp.set('v.conditions', responseData['conditions'])
                    cmp.set('v.icon', responseData['icon'])
                    cmp.set('v.sunrise', responseData['sunrise'])
                    cmp.set('v.sunriseEpoch', responseData['sunriseEpoch'])
                    cmp.set('v.sunset', responseData['sunset'])
                    cmp.set('v.moonphase', responseData['moonphase'])

                    
                    cmp.set('v.issearching', false);
                    cmp.set('v.hasData', true)
                }
                else if (state === "ERROR") {
                    var errors = response.getError();
                    if (errors) {
                        if (errors[0] && errors[0].message) {
                            console.log("Error message: " + 
                                     errors[0].message);
                        }
                    } else {
                        console.log("Unknown error");
                    }
                }

            })
            $A.enqueueAction(action);
        }
    },

    searchHandler:function(cmp,evt){
        var termSize = cmp.find('enter-search').get('v.value');
        if(!termSize){
            cmp.set('v.hasData', false)
        }
        
    }


    
});