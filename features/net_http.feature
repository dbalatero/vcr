@net_http
Feature: Net::HTTP
  In order to have deterministic, fast tests that do not depend on an internet connection
  As a TDD/BDD developer
  I want to use VCR with Net::HTTP

  Scenario: Record an asynchronous request (such as for mechanize)
    Given we do not have a "temp/asynchronous" cassette
     When I make an asynchronous Net::HTTP get request to "http://example.com" while using the "temp/asynchronous" cassette
     Then the "temp/asynchronous" library file should have a response for "http://example.com" that matches /You have reached this web page by typing.*example\.com/

  @copy_not_the_real_response_to_temp
  Scenario: Replay a response for an asynchronous request (such as for mechanize)
    Given the "temp/not_the_real_response" library file has a response for "http://example.com" that matches /This is not the real response from example\.com/
     When I make a replayed asynchronous Net::HTTP get request to "http://example.com" while using the "temp/not_the_real_response" cassette
     Then the response for "http://example.com" should match /This is not the real response from example\.com/

  Scenario: Record a recursive post request
    Given we do not have a "temp/recursive_post" cassette
     When I make a recursive Net::HTTP post request to "http://example.com" while using the "temp/recursive_post" cassette
     Then the "temp/recursive_post" library file should have a response for "http://example.com" that matches /You have reached this web page by typing.*example\.com/
      And the "temp/recursive_post" library file should have exactly 1 response

  Scenario: Record a request with a block with a return statement
    Given we do not have a "temp/block_with_a_return" cassette
     When I make a returning block Net::HTTP get request to "http://example.com" while using the "temp/block_with_a_return" cassette
     Then the "temp/block_with_a_return" library file should have a response for "http://example.com" that matches /You have reached this web page by typing.*example\.com/

  Scenario: Record a request made with open uri
    Given we do not have a "temp/open_uri" cassette
     When I make an open uri Net::HTTP get request to "http://example.com" while using the "temp/open_uri" cassette
     Then the "temp/open_uri" library file should have a response for "http://example.com" that matches /You have reached this web page by typing.*example\.com/

  @copy_not_the_real_response_to_temp
  Scenario: Replay a response for an open uri request
    Given the "temp/not_the_real_response" library file has a response for "http://example.com" that matches /This is not the real response from example\.com/
     When I make an open uri Net::HTTP get request to "http://example.com" while using the "temp/not_the_real_response" cassette
     Then the response for "http://example.com" should match /This is not the real response from example\.com/
