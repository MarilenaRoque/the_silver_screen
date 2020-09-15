# ThE SilveR ScreeN - A Blog App about Movies and Everything related

> On this project I will develop a blog app, customized with the theme: Movies.
Design idea by [Nelson Sakwa on Behance](https://www.behance.net/gallery/14500909/liFEsTlye-Magazine-style-Design-Freebie)

## You can access our social media [HERE]()

![Timeline View](./app/assets/images/screenshot.png)

## Schema

![Schema](./app/assets/images/ERD.png)

The project has 4 Models

- User
- Article
- Vote
- Category

Associated to each other as described below:

- User has zero or many articles
- Article belongs to a user
- An Article has zero or many votes
- A User has zero or many votes
- A vote belongs to a User and belongs to an Article
- A Category has many or zero Articles
- An article has one or many Categories

## Features Built

If you're no authenticated User, you can

- Sign Up
- Sign In

If you are an authenticated User, you can

- See all articles
- See articles by category
- Create articles
- Vote articles


## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- PostgreSQL, '>= 0.18', '< 2.0'

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

## Getting Started

To get a local copy up and running follow these simple example steps.

- Clone this repository
- Open a terminal on the containing folder of this project

### Setup


- Run 'bundle install' to install the dependencies
- Set the database using the command 'bin/rake db:migrate'



### Usage

- Run the server using the command 'rails server'
- Access http://localhost:3000/ in your browser
- Use the navbar links to explore the features (make sure to create a user to have access to all features)


## Authors

👤 **Marilena Roque**

- Github: [MarilenaRoque](https://github.com/MarilenaRoque)
- Twitter: [@MariRoq88285995](https://twitter.com/MariRoq88285995)
- Linkedin: [roquemarilena](https://www.linkedin.com/in/roquemarilena/)



## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!





