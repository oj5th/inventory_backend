# Overview

- This is a simple book inventory system and this is for backend (API) purposes only.

## Requirements

- ruby version '2.6.3'
- rails version '5.2.3'
- postgresql

## Installation

To setup, you need to run the following commands.

```
bundle install
rails db:crete
rails db:migrate
rails db:seed
```

## Usage

1. Make sure you have setup the cors properly:
	- Update `config/initializers/cors.rb` port. Make sure that you enter the port from frontend `http://localhost:<PORT>`.
  - Port will show after you setup inventory-frontend and run `yarn dev`.

	```
	allow do
    origins 'http://localhost:8080'

    resource '*',
      headers: :any,
      credentials: true,
      methods: [:get, :post, :put, :patch, :delete, :options, :head]
  end
  ```

2. Run `localhost:3000` to make API up and running.
