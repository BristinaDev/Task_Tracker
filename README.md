# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
- Ruby "3.1.6"

* System dependencies
- Rails 7.1.3.4
- Node v22.4.0
- Bundler version 2.5.14
- yarn 1.22.22

* Configuration

* Database creation * Database initialization

```rails db:create```
```rails db:migarte```
```rails db:seed```

* How to run the test suit
```rails assets:precompile``` #if needed
* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* The API and Web
`http://localhost:3000/users/sign_up`
`http://localhost:3000/users/sign_in`
`http://localhost:3000/api/v1/max_sum`
- **POST** `/max_sum`

### Request

- **Content-Type:** `application/json`
- **Body:**
  ```json
  {
    "array": [-1, 2, -3, 1, 0, 3]
  }
