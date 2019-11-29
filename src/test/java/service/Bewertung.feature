Feature: How the services work together

 Background:
   * def env = read('Environment.csv')

   * def keys = function(o){ return o.keySet() }
   * def random = function(max){ return Math.floor(Math.random() * max) }

   * url karate.jsonPath(env,"$[?(@.Name=='baseUri')].Value")[0]
   * def makers = karate.jsonPath(env,"$[?(@.Name=='Makers')].Value")[0]
   * def models =  karate.jsonPath(env,"$[?(@.Name=='Models')].Value")[0]
   * def buildDate = karate.jsonPath(env,"$[?(@.Name=='Build Date')].Value")[0]
   * def wa_key = karate.jsonPath(env,"$[?(@.Name=='wa_key')].Value")[0]





   * def  schema =
     """
    {
      page: '#number',
      pageSize: '#number',
      totalPageCount: '#number',
      wkda: '#object'
    }
    """


  Scenario: Full Service
    Given path makers
    And param wa_key = wa_key
    When method get
    Then status 200
    And match response == schema
    And print response.wkda
    And json makersList = keys(response.wkda)

    Then path models
    And def maker = makersList[random( karate.sizeOf(makersList))]
    And param manufacturer = maker
    And param wa_key = wa_key
    When method get
    Then status 200
    And match response == schema
    And print response.wkda
    And json modelsList = keys(response.wkda)

    Then path buildDate
    And param manufacturer = maker
    And param main-type = modelsList[random( karate.sizeOf(modelsList))]
    And param wa_key = wa_key
    When method get
    Then status 200
    And match response == schema







