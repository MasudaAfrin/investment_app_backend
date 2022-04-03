# README

This is a dockerize mini seedrs app consist of two APIs. One for retrieving capaigns and other is to invest in particular campaign.
Campaign has sectors, country and other attributes.

* Ruby version - 2.7.1

* Rails version > 6

* Database - Postgresql


**How to run:**

Before proceed please ensure you have docker and docker-compose installed in your local machine
with a user sudo privilege, added to the docker group.

* Make .env file and database.yml file like example.env and config/exp_database.yml
* run 'docker-compose build'
* run 'docker-compose run web bundle exec rails db:create'
* run 'docker-compose run web bundle exec rails db:migrate'
* for testing run 'docker-compose run web bundle exec rails spec'
* for spinning up the server the app run 'docker-compose up --build'
* to stop and remove the container run 'docker-compose down'



**API Documentation**

**Retrieve the Campaigns**
----
BASE_URL = http://localhost:3000
* **URL**: ``BASE_URL + /api/v1/campaigns?page=1&per_page=3``

* **Method:** `GET`

*  **URL Params:** `{ page: '' //integer,
   per_page: '' //integer, sector_id: '' //integer, optional, country_id: ''//integer, optional
   }`

* **Success Response:**
 ```json
{
  "success": true,
  "status": 200,
  "message": "Successfully fetched",
  "data": [
    {
      "id": 50,
      "name": "Eos sit dolore quia.",
      "target_amount": "21.37",
      "percentage_raised": "0.0",
      "investment_multiple": "2.0",
      "sector_id": 3,
      "sector_name": "voluptate",
      "country_id": 5,
      "country_name": "Niger",
      "image_url": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhlR2c1T0dsNGVuSmxOVFI2YXpaMlpIbHhaVFZzTmpSb00ydGxZZ1k2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUTJsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1OaGJYQmhhV2R1TG1wd1p5STdJR1pwYkdWdVlXMWxLajFWVkVZdE9DY25ZMkZ0Y0dGcFoyNHVhbkJuQmpzR1ZEb1JZMjl1ZEdWdWRGOTBlWEJsU1NJUGFXMWhaMlV2YW5CbFp3WTdCbFE2RVhObGNuWnBZMlZmYm1GdFpUb0tiRzlqWVd3PSIsImV4cCI6IjIwMjItMDQtMDNUMDY6MTM6MTMuNzgyWiIsInB1ciI6ImJsb2Jfa2V5In19--ebb4ca131b6bd97bf274234a3b1005b41e47b699/campaign.jpg"
    },
    {
      "id": 49,
      "name": "Earum ut et nihil.",
      "target_amount": "4275.74",
      "percentage_raised": "0.0",
      "investment_multiple": "24.0",
      "sector_id": 4,
      "sector_name": "rerum",
      "country_id": 5,
      "country_name": "Niger",
      "image_url": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhkbnBpZG1rMU0yTXpkV1pyZDJZellUbHdaMk5wYjI1ek5IQnVkQVk2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUTJsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1OaGJYQmhhV2R1TG1wd1p5STdJR1pwYkdWdVlXMWxLajFWVkVZdE9DY25ZMkZ0Y0dGcFoyNHVhbkJuQmpzR1ZEb1JZMjl1ZEdWdWRGOTBlWEJsU1NJUGFXMWhaMlV2YW5CbFp3WTdCbFE2RVhObGNuWnBZMlZmYm1GdFpUb0tiRzlqWVd3PSIsImV4cCI6IjIwMjItMDQtMDNUMDY6MTM6MTMuNzg2WiIsInB1ciI6ImJsb2Jfa2V5In19--89c933fef503e3908f95986f7ab98ff7270eac5e/campaign.jpg"
    },
    {
      "id": 48,
      "name": "Architecto eos sint et.",
      "target_amount": "3849.83",
      "percentage_raised": "0.0",
      "investment_multiple": "71.0",
      "sector_id": 4,
      "sector_name": "rerum",
      "country_id": 5,
      "country_name": "Niger",
      "image_url": "http://localhost:3000/rails/active_storage/disk/eyJfcmFpbHMiOnsibWVzc2FnZSI6IkJBaDdDVG9JYTJWNVNTSWhiRzkwWVRkNE1XRnlNekpuWm1Jd2VUbGllak0xZDNkbWJXdDVkZ1k2QmtWVU9oQmthWE53YjNOcGRHbHZia2tpUTJsdWJHbHVaVHNnWm1sc1pXNWhiV1U5SW1OaGJYQmhhV2R1TG1wd1p5STdJR1pwYkdWdVlXMWxLajFWVkVZdE9DY25ZMkZ0Y0dGcFoyNHVhbkJuQmpzR1ZEb1JZMjl1ZEdWdWRGOTBlWEJsU1NJUGFXMWhaMlV2YW5CbFp3WTdCbFE2RVhObGNuWnBZMlZmYm1GdFpUb0tiRzlqWVd3PSIsImV4cCI6IjIwMjItMDQtMDNUMDY6MTM6MTMuNzkwWiIsInB1ciI6ImJsb2Jfa2V5In19--5128bb8910f64e48caba3dca85de6374e99cc7bf/campaign.jpg"
    }
  ]
}
```

* **Code:** `200`
* **Error Response:**
    * **Code:** `200`
    * **Content:**
         ```json
          { "success": false,
            "status": 500,
            "message": "Failed to fetch campaign data",
            "data": {} }
         ```

**Make investment API**
----
BASE_URL = http://localhost:3000
* **URL**: ``BASE_URL + /api/v1/invests``

* **Method:** `POST`

* **Request Params:** `{ campaign_id: 49 //integer,
   amount: 14 //decimal, cheque_no: '34567' //string, optional
   }`

* **Success Response:**
 ```json
{
  "success": true,
  "status": 201,
  "message": "Successfully created",
  "data": {}
}
```

* **Code:** `200`
* **Error Response:**
    * **Code:** `200`
    * **Content:**
         ```json
          { "success": false,
            "status": 422,
            "message": "Failed to create investment",
            "data": {} }
         ```
