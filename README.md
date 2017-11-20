# Bookmark Manager
## Week 4 Challenge

#### Introduction
The work in week 4 built on week 3's [battle](https://github.com/peterwdj/Battle) app, as we continued using the Sinatra Ruby framework to build web applications. This week, we deployed code to Heroku in order to host it remotely on the internet. See [below](Instructions) to find this. The big difference with this week's work was the use of databases (PostgreSQL) and object-relational mappers (DataMapper) to persist data within the application.


#### Instructions
To run this application, either start a local server with a tool such as Rackup and visit the correct port, or visit http://bookmark-manager-peterwdj.herokuapp.com/. By the end of the week, not all functionality had been implemented due to challenges with setting up PostgreSQL (see below). As a result, the application lacks graphical navigation. In order to add a new bookmark, navigate to the '/links/new' URL to add a new link to the manager, and navigate to '/tags/[TAG]' to filter links with specific tags such as 'media', or 'social'.


#### Challenges
This week was the most challenging yet, and I was not aided by my development environment (a Chromebook, running Ubuntu via [Crouton](https://github.com/dnschneid/crouton)), which led to issues installing and using PostgreSQL. This took up a significant amount of my coding time during the week, and meant I was ultimately unable to get to the stage of implementing functionality such as signing in and signing out. This is definitely something I will come back to and work on.

Another challenge of the week was setting up separate development environments for testing, developing, and deploying code, which was satisfyingly helpful once done, but took a while to set up correctly.
