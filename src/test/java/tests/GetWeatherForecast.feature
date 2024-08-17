Feature: Get Weather Forecast in Jakarta Selatan

  Background:
    * url 'http://api.openweathermap.org/data/2.5'
    * def apiKey = 'd3e8b575395492d14bab22fce43036f8'
    * def lat = '-6.2615'
    * def lon = '106.8101'
    * def expectedSchema = read('WeatherForecastSchema.json')

  Scenario: Verify the response code
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200

  Scenario: Verify non empty response
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match response.list == '#[]'

  Scenario: Verify the city name and city id
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And assert response.city.id == 6754916
    And assert response.city.name == 'Rawa Barat'


  Scenario: Verify the cnt
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And assert response.cnt == 40

  Scenario: Validate the forecast list structure
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And assert response.list.length == 40

  Scenario: Validate the temperature forecast is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].main.temp != null

  Scenario: Validate the weather condition description is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].description != null

  Scenario: Validate the cloud is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].clouds.all != null

  Scenario: Validate the wind speed and direction is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].wind.speed != null
    And match each response.list[*].wind.deg != null

  Scenario: Validate the visibility in all forecasts is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].visibility != null

  Scenario: Validate the date is not null
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    Then status 200
    And match each response.list[*].dt_txt != null

  Scenario: Validate the JSON schema for the response
    Given path 'forecast'
    And param lat = lat
    And param lon = lon
    And param appid = apiKey
    When method GET
    And print expectedSchema
    Then status 200
    * match response contains expectedSchema