Feature: Get Current Air Pollution of Jakarta Selatan

  Background:
    * url 'http://api.openweathermap.org/data/2.5'
    * def apiKey = 'd3e8b575395492d14bab22fce43036f8'
    * def lat = '-6.2615'
    * def lon = '106.8101'
    * def expectedSchema = read('AirPollutionSchema.json')

  Scenario: Verify the response code
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200

  Scenario: Verify non empty response
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list == '#[]'

  Scenario: Verify that the coordinates returned match the coordinates requested
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.coord.lon == parseFloat(lon)
    And match response.coord.lat == parseFloat(lat)

  Scenario: Validate the air quality index value is not null
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list[0].main.aqi != null

  Scenario: Validate the air quality index value
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list[0].main.aqi == '#? _ >= 1 && _ <= 5'

  Scenario: Validate the datetime format of the dt attribute is not null
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list[0].dt != null

  Scenario: Validate of pollutant components in the response is not null
    Given path 'air_pollution'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list[0].components.co != null
    And match response.list[0].components.no != null
    And match response.list[0].components.no2 != null
    And match response.list[0].components.o3 != null
    And match response.list[0].components.so2 != null
    And match response.list[0].components.pm2_5 != null
    And match response.list[0].components.pm10 != null
    And match response.list[0].components.nh3 != null

  Scenario: Validate the json schema for the response
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    And print expectedSchema
    Then status 200
    * match response contains expectedSchema