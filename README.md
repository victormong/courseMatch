# CourseMatch

A courseMatch is a web application build using **Ruby on Rails** which lets online learners find courses and recommends courses for learners' based on their ratings.
It uses **Coursera API** and **Udacity** API to find courses information that the learner may be interested in. The application allows the user to search for a particular course and it lists three types of courses based on the level of expertise required for the course - *Beginner*, *Intermediate* and *Advanced*.

The application also recommends courses for users with the help of the ratings provided by the user if the he/she has already taken that course. **Collaborative filtering** is employed to find the similiarty between learners and is then used to render recommendations for the end user.

## Dependencies

The application requires `ElasticSearch`. For instructions on installing elasticsearch, see https://www.elastic.co/guide/en/elasticsearch/reference/current/setup-service.html#_linux

## Getting Started

1. Clone or download the application
2. Run `bundle install` to install the gems required by the application
3. Run `bundle exec rake db:migrate` to migrate the database
4. Run `bundle exec rake db:seed` to seed the database
5. Start the ElasticSearch service by running `sudo /etc/init.d/elasticsearch start`
5. Start the rails server using `rails s`
6. Visit `http://localhost:3000`
