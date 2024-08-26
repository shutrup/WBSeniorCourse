# CurrentWeatherDataAPI

All URIs are relative to *https://api.openweathermap.org/data/2.5*

Method | HTTP request | Description
------------- | ------------- | -------------
[**currentWeatherData**](CurrentWeatherDataAPI.md#currentweatherdata) | **GET** /weather | Call current weather data for one location


# **currentWeatherData**
```swift
    open class func currentWeatherData(q: String? = nil, completion: @escaping (_ data: Model200?, _ error: Error?) -> Void)
```

Call current weather data for one location

Get the current weather info

### Example
```swift
// The following code samples are still beta. For any issue, please report via http://github.com/OpenAPITools/openapi-generator/issues/new
import OpenAPIClient

let q = "q_example" // String | For the query value, type the city name and optionally the country code divided by comma; use ISO 3166 country codes. (optional)

// Call current weather data for one location
CurrentWeatherDataAPI.currentWeatherData(q: q) { (response, error) in
    guard error == nil else {
        print(error)
        return
    }

    if (response) {
        dump(response)
    }
}
```

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **q** | **String** | For the query value, type the city name and optionally the country code divided by comma; use ISO 3166 country codes. | [optional] 

### Return type

[**Model200**](Model200.md)

### Authorization

[app_id](../README.md#app_id)

### HTTP request headers

 - **Content-Type**: Not defined
 - **Accept**: application/json, text/plain

[[Back to top]](#) [[Back to API list]](../README.md#documentation-for-api-endpoints) [[Back to Model list]](../README.md#documentation-for-models) [[Back to README]](../README.md)

