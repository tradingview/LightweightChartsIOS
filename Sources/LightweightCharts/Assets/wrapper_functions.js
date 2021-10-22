function promptFunction(objectName) {
    return function(params) {
        try {
            var payload = {object: objectName, params: params};
            var result = prompt(JSON.stringify(payload));
            return result;
        } catch(err) {
            console.log('Error with function ' + object + '.')
        }
    }
}

function promptTickMarkFormatterFunction(objectName) {
    return function(time, tickMarkType, locale) {
        try {
            var payload = {object: objectName, params: {time: time, tickMarkType: tickMarkType, locale: locale}};
            var result = prompt(JSON.stringify(payload));
            return result;
        } catch(err) {
            console.log('Error with function ' + object + '.')
        }
    }
}

function promptAutoscaleInfoProviderFunction(objectName) {
    return function(baseImplementation) {
        try {
            var payload = {object: objectName, params: baseImplementation()};
            var result = prompt(JSON.stringify(payload));
            return JSON.parse(result);
        } catch(err) {
            console.log('Error with function ' + object + '.')
        }
    }
}

function postMessageFunction(name) {
    return function(param) {
        window.webkit.messageHandlers[name].postMessage(JSON.stringify(param));
    }
}

function subscriberCrosshairMoveAndClickFunction(name) {
    return function(param) {
        var parameters = param;
        var dict = {};
        seriesArray.forEach(function(stored) {
            var price = param.seriesPrices.get(stored.series);
            if (price != null) {
                dict[stored.name] = price;
            }
        });
        parameters.seriesPrices = dict;
        window.webkit.messageHandlers[name].postMessage(JSON.stringify(parameters));
    }
}
