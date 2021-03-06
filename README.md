# ThE SilveR ScreeN - A Blog App about Movies and Everything related

> On this project I developed a blog app, about movies, using Rails and Bootstrap.
> On that blog you can sign up to enjoy all the features available, such as: Read and write articles, see them by category, vote and bookmark your favorites ones.
Design idea by [Nelson Sakwa on Behance](https://www.behance.net/gallery/14500909/liFEsTlye-Magazine-style-Design-Freebie)

## You can access the blog [HERE](https://blogthesilverscreen.herokuapp.com/)

![Index View](./app/assets/images/screenshot.png)
![Show View](./app/assets/images/screenshot1.png)
![Bookmarks View](./app/assets/images/screenshot2.png)

## Schema without Extra Feature

![Schema](./app/assets/images/ERD.png)

The project has 5 Models

- User
- Article
- Vote
- Category
- Bookmarks

Associated to each other as described below:

- User has zero or many articles
- Article belongs to a user
- An Article has zero or many votes
- A User has zero or many votes
- A vote belongs to a User and belongs to an Article
- A bookmark belongs to a User and belongs to an Article
- A Category has many or zero Articles
- An article has one or many Categories

## Features Built

If you're no authenticated User, you can

- Sign Up
- Sign In

If you are an authenticated User, you can

- The user is presented with the homepage, that includes:
 1. Most voted article with full-width image and title in the first row.
 2. List of all categories in order of priority. Each category displayed as a square with its name on the top and its most recent article's title in the bottom. The background image is the image of the most recent article in this category.

- Navbar has links to:
    1. Create a new artice
    2. Home
    3. See your favorite articles

- When the User click on a Category
    1. Display all articles sorted by most recent
    2. Category and preview text truncated
    3. Button to vote or unvote
    4. Button to bookmark or unmark an article


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
 > `git clone <repo>`
- Open a terminal on the containing folder of this project
> `cd <folder>`


### Setup

- Install all the dependencies
> `bundle install`

- Iniciate your database running
> `rails db:create`

- Set all the database running

> `rails db:migrate`

### Running tests

This repo contains files to test the validations and associations on models.
You can run the following command on your terminal to run the tests.

> ` rspec .`

or customize them changing the files inside the spec folder.


### Running Locally

- Run the server using the command:

> `rails server`

- Access http://localhost:3000/ in your browser

- Use the navbar links to explore the features (make sure to create a user to have access to all features)


### Active Storage for Article Images

This project uses local disk for development and Cloudinary for production. If you want to use Cloudinary to store your images you can:


> Set your account on [Cloudinary](https://cloudinary.com/)
> It will Generate an API key and API secret that can be found on your Cloudinary dashboard
> Replace the generated keys on the `template.env` file and rename it to only `.env`
> Replace your username on the cloudinary.yml file

To change the kind of storage you should make sure that the environment file inside ./config/environments/<environment>.rb is correct set.
Example:
> `config.active_storage.service = :local`   
> stores the images locally
> `config.active_storage.service = :cloudinary`   
> stores the images on cloudinary


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





