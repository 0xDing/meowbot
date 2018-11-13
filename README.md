# MeowBot

> Made with love in Shanghai.

## Development Requirements
* ngrok
## Runtime Requirements
* Ruby 2.5.1
* PostgreSQL 9.6+
* Google App Engine
* Google Dialogflow

## Request Lifecycle

```
                                       | --> ruyi.ai
                                       | --> dialogflow direct reslut
telegram --> meowbot --> dialogflow -->| --> meowbot local services
                                       | --> Third-party APIs