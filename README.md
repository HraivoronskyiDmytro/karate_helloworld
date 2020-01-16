# karate_helloworld

This is an example of usage karate framework for bdd based api testing

Based on https://github.com/intuit/karate

Feature files are in /src/test/resources/service/

before run add Environment.csv to /src/test/resources/ with next data:

baseUri - Base URI of the service.

wa_key - key for authentification on the service

Makers - 1-st endpoint - get list of available maker

Models - 2-nd endpoint - set as parameter random value from makers list, return list of available models of this manufacturer

Build Date - 3-rd endpoint - set as parameters random value from makers list & random value from model list, return list of available build dates

_______________________________________________________________________

to run tests please execute in the command promt:" ./gradlew test "


