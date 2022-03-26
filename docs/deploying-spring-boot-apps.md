```
:::-- rundoc
email = ENV['HEROKU_EMAIL'] || `heroku auth:whoami`

Rundoc.configure do |config|
  config.project_root = "deploying-spring-boot-apps"
  config.filter_sensitive(email => "developer@example.com")
end
```
<!--
  rundoc src:
  https://github.com/heroku/java-getting-started/blob/main/deploying-spring-boot-apps.md

  Command:
  $ rundoc build --path deploying-spring-boot-apps.md
-->

The Spring Boot model of deploying standalone applications is a great
fit for Heroku. You can use either Maven or Gradle to deploy a Spring application on Heroku, but for this guide we'll assume that you're using Maven and have [Maven 3](http://maven.apache.org/download.html) installed on your machine.

To begin, create a [free Heroku account](https://signup.heroku.com/).
Then download and install the Heroku CLI.

<a class="toolbelt" href="https://cli.heroku.com">Download the Heroku CLI</a>

Once installed, you can use the `heroku` command from the terminal to log in using the email address and password you used when creating your Heroku account:

```term
$ heroku login
heroku: Press any key to open up the browser to login or q to exit
 ›   Warning: If browser does not open, visit
 ›   https://cli-auth.heroku.com/auth/browser/***
heroku: Waiting for login...
Logging in... done
Logged in as me@example.com
```

To check that your key was added, run `heroku keys`. If your key isn’t there, you
can add it manually by running `heroku keys:add`. For more information about SSH
keys, see [Managing Your SSH Keys](https://devcenter.heroku.com/articles/keys).

## Creating a Spring Boot app

To create a new Spring Boot application, first install the Spring Boot CLI as described in the [Spring Boot documentation](https://docs.spring.io/spring-boot/docs/current/reference/html/cli-using-the-cli.html). This will add a `spring` command to your path.

>note
>You can also start with a working [sample app](https://github.com/heroku/java-getting-started) if you'd prefer.

Use the CLI to create a new application by running this command:

```term
:::>- $ spring init --dependencies=web demo
```

Then move into the application directory:

```term
:::>- $ cd demo
```

The application does not have any custom logic by default -- it's just an empty template. To add some behavior, open the `src/main/java/com/example/demo/DemoApplication.java` file and put the following code in it:

```java
:::>> file.write src/main/java/com/example/demo/DemoApplication.java
package com.example.demo;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.*;
import org.springframework.stereotype.*;

@Controller
@SpringBootApplication
public class DemoApplication {

    @RequestMapping("/")
    @ResponseBody
    String home() {
      return "Hello World!";
    }

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }
}
```

This creates a simple request mapping that displayed "Hello World!" in the browser. You could run the application locally to confirm this, but we'll jump straight to running it on Heroku.

## Preparing a Spring Boot app for Heroku

Before you can deploy the app to Heroku, you'll need to create a Git repository for the application and add all of the code to it by running these commands:

```term
:::>- $ git init
:::>- $ git add .
:::>- $ git commit -m "first commit"
```

You'll deploy the app by pushing this Git repo to Heroku. It's also possible to deploy using the [Heroku Maven plugin](deploying-java-applications-with-the-heroku-maven-plugin), but this guide will focus on using Git and the Heroku CLI.

In order to deploy to Heroku, you'll first need to provision a new Heroku app. Run this command:

```term
:::>> $ heroku create
```

This also creates a remote repository called `heroku` in
your local git repo. Heroku generates a random name (in this case `nameless-lake-8055`)
for your app. You can rename it later with the `heroku apps:rename` command.

Now deploy your code:

```term
:::>- $ git push heroku main || git push heroku master
:::-> | (head -6; echo "..."; tail -18)
```

Heroku automatically detects the application as a Maven/Java app due to the presence of a `pom.xml` file. It installed Java 8 by default, but you can easily configure this with a `system.properties` file as described in the [Specifying a Java version](https://devcenter.heroku.com/articles/java-support#specifying-a-java-version) Dev Center article. It will run your app using the [default command](https://devcenter.heroku.com/articles/java-support#default-web-process-type).

All that said, the application is now deployed. You can visit the app's URL by running this command:

```term
:::>- $ heroku open
```

You'll see the "Hello World!" text in the browser.

You can view the logs for the application by running this command:

```term
:::>- background.start("heroku logs --tail", name: "tail", wait: "State changed from starting to up", timeout: 45)
:::-> | tail -10
:::-- background.stop(name: "tail")
```

Reload your application in the browser, and you’ll see another log message generated for that request. Press `Control+C` to stop streaming the logs.

To learn more about the basics of deploying a Maven-based Java application on Heroku, try following the [Getting Started with Java on Heroku](getting-started-with-java) guide. This guide covers many steps that are not specific to Spring Boot.

The remainder of this article provides a cursory overview of some of the most common settings you'll need to adjust.

## Connecting to a database

You can attach a PostgreSQL database to your app by running the following command from the CLI:

```term
:::>- $ heroku addons:create heroku-postgresql
```

If you prefer to use MySQL or another database vendor, check out [Add-ons Marketplace](https://elements.heroku.com/addons) to see what is available.

Now you can list the configuration variables for your app to display the URL needed to connect to the database, DATABASE_URL:

```term
:::>> $ heroku config
```

Heroku also provides a `pg` command that shows a lot more:

```term
:::>> $ heroku pg
```

This indicates a hobby database (free) is running Postgres 9.3.3, with a single row of data.

Once the database add-on has been created, Heroku will automatically populate the environment variables `SPRING_DATASOURCE_URL`, `SPRING_DATASOURCE_USERNAME`, and `SPRING_DATASOURCE_PASSWORD`. These environment variables should allow your Spring Boot application to connect to the database without any other configuration as long as you add a PostgreSQL JDBC driver to your dependencies like so:

```xml
:::>> file.append("pom.xml#26")
<dependency>
  <groupId>org.springframework.boot</groupId>
  <artifactId>spring-boot-starter-jdbc</artifactId>
</dependency>
<dependency>
  <groupId>org.postgresql</groupId>
  <artifactId>postgresql</artifactId>
</dependency>
```

You can customize your application's database configuration in your `application.properties`. For example:


```properties
:::>> file.write src/main/resources/application.properties
spring.datasource.driverClassName=org.postgresql.Driver
spring.datasource.maxActive=10
spring.datasource.maxIdle=5
spring.datasource.minIdle=2
spring.datasource.initialSize=5
spring.datasource.removeAbandoned=true
```

Then you can then add a configuration bean to your app.

```java
:::>> file.write src/main/java/demo/DatabaseConfig.java
package com.example.demo;

import com.zaxxer.hikari.*;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.*;
import javax.sql.DataSource;

@Configuration
public class DatabaseConfig {

  @Value("${spring.datasource.url}")
  private String dbUrl;

  @Bean
  public DataSource dataSource() {
      HikariConfig config = new HikariConfig();
      config.setJdbcUrl(dbUrl);
      return new HikariDataSource(config);
  }
}
```

```
:::-- $ git add .
:::-- $ git commit -m "database"
:::-- $ git push heroku main || git push heroku master
:::-- $ cd ..
:::-- $ mv demo deploying-spring-boot-apps
```

For more information, see [Connecting to Relational Databases on Heroku with Java](articles/connecting-to-relational-databases-on-heroku-with-java).

Now your application should be able to connect to the database. You can follow our guide on [Running Database Migrations for Java Apps](https://devcenter.heroku.com/articles/running-database-migrations-for-java-apps) to initialize the database. The [sample app](https://github.com/kissaten/spring-boot-heroku-demo) uses Liquibase.

## Customizing the boot command

You can override the default command used to run your app or define custom process types using a [`Procfile`](https://devcenter.heroku.com/articles/procfile). The correct command depends on what you need to do with your app. Common process types are used to [run a web process](https://devcenter.heroku.com/articles/java-support#default-web-process-type) or [run database migrations](https://devcenter.heroku.com/articles/running-database-migrations-for-java-apps).

## Next steps

For more complete examples of Spring Boot apps that run on Heroku see:

* [Getting Started on Heroku with Java](articles/getting-started-with-java#introduction)
* [Spring Petclinic Demo for Heroku](https://github.com/kissaten/spring-petclinic)

Heroku provides a wide range of features for Spring applications. You can provision
add-ons that introduce third-party cloud services like persistence, logging, monitoring and more.
The [add-on marketplace](https://elements.heroku.com/addons/#data-stores) has a large
number of data stores, from Redis and MongoDB providers, to Postgres and MySQL.

You can read more about [How Heroku Works](https://devcenter.heroku.com/articles/how-heroku-works)
to get a technical overview of the concepts you’ll encounter while writing, configuring, deploying and running applications.
Then visit the [Java category on Dev Center](https://devcenter.heroku.com/categories/java-support)
to learn more about developing and deploying Spring applications.
If you experience any trouble with your application as you migrate to Heroku, reach out to any of our [Support channels](https://devcenter.heroku.com/articles/support-channels).

For more information on deploying Spring apps, see the [Spring documentation](http://projects.spring.io/spring-boot/#quick-start) and the [Spring Boot documentation on deploy to Heroku](http://docs.spring.io/spring-boot/docs/current/reference/html/cloud-deployment.html#cloud-deployment-heroku).
