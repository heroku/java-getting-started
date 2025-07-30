# Building the local server
To build, run `./mvnw clean install` from the command line.

# Running the local server
To run the app locally, run `heroku local --port 5001` from the command line.

# Connecting to the database remotely
To connect to the heroku database, run `heroku pg:psql`. You will be able to run postgres commands from there.

# Deploying
To deploy to heroku, run `git push heroku main`.