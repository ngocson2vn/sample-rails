# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# Command
```
rails generate scaffold authorized_service application_name:string:uniq old_application_token:string valid_until:datetime application_token:string:uniq
```

## Get authorized services
curl -i -XGET http://localhost:3000/clientoken/authorized_services

## Refresh application_token for this service
curl -XPUT http://localhost:3000/clientoken/authorized_services -H "Content-Type: application/json" -d '{"authorized_service": {"application_name": "rankie", "application_token": "ffc8776429507f675bb9b79b7cdb21cd"}}'

## Authorize services
curl -XPOST http://localhost:3000/clientoken/authorized_services -H "Content-Type: application/json" -d '{"authorized_services": [{"application_name": "requl_mobile", "application_token": "0003fd4d7a3edd834ff5390a40c347d9"}, {"application_name": "wellness_ai", "application_token": "0fdfbff7de440ef56919941ca4880db7"}]}'

## Revoke services
curl -XDELETE http://localhost:3000/clientoken/authorized_services -H "Content-Type: application/json" -d '{"authorized_services": ["requl_mobile"]}'

