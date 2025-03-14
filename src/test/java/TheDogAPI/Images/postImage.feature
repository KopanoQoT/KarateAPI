Feature: Posting an image to the Dog API

  Background:
    * def key = dogApiKey
    * def myUrl = dogApiBaseUrl
    * url myUrl
    * header x-api-key = dogApiKey
    * header Content-Type = 'multipart/form-data'

  Scenario Outline: Post an image to the Dog API
    Given path '/images/upload'
    And multipart file file = { read: 'resources/<imageName>', filename: '<imageName>', contentType: 'image/jpeg' }
    And multipart field sub_id = <Sub_ID>
    And multipart field breed_ids = <Breed_ID>
    When method POST
    Then status <Status_code>
    And match response.id != null
    And match response.url == '#regex https?://.*'


#    call get image by id
    * def imageId = response.id
#    * def callGetImageById = call read('getImageById.feature'){'id' : '#(imageId)'}


#    call get image breed
#    * def callGetImageBreed = call read('getImageBreed.feature'){'id' : '#(imageId)', 'breeds_id': <Breed_ID>, 'baseUrl': '#(myUrl)', 'api-key':'#(key)'}


#    call post image breed
#    * def callPostImageBreed = call read('postImageBreed.feature'){'id' : '#(imageId)', 'breeds_id': <Breed_ID>}

    #    call delete image breed
#    * def callDeleteImageBreed = call read('DeleteImageBreed.feature'){'id' : '#(imageId)', 'breeds_id': <Breed_ID>}

    #    call delete image by id
#    * def DeleteImageById = call read('DeleteImageById.feature'){'id' : '#(imageId)'}

Examples:
  |imageName |Sub_ID    |Breed_ID    |Status_code|
  |dog.jpg   |'Kopano'  |101           |201       |
#  |           |'Kopano1' |15           |400       |
#  |dog2.jpg  |           |           |404|
#  |dog3.jpg  |'Kopano3' |69           |
#  |dog4.jpg  |'Kopano4' |82           |


