```
:::-- rundoc
email = ENV['HEROKU_EMAIL'] || `heroku auth:whoami`

Rundoc.configure do |config|
  config.project_root = "java-getting-started"
  config.filter_sensitive(email => "developer@example.com")
end
```
<!--
  rundoc src:
  https://github.com/heroku/java-getting-started/blob/main/java-getting-started.md

  Command:
  $ rundoc build --path java-getting-started.md
-->

<h2 data-next-message="I'm ready to start">Introduction</h2>

Deploy a Java app in minutes with this tutorial.

The tutorial assumes that you already have:

* A free <a href="https://signup.heroku.com/signup/dc" target="_blank">Heroku account</a>
* <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">Java 8</a> installed
* <a href="http://maven.apache.org/download.html" target="_blank">Maven 3</a> installed
* <a href="https://devcenter.heroku.com/articles/heroku-postgresql#local-setup" target="_blank">Postgres</a> installed locally

If you'd prefer to use Gradle instead of Maven, see the [Getting Started with Gradle on Heroku](getting-started-with-gradle-on-heroku) guide.

<h2 data-next-message="I installed the Heroku CLI">Set Up</h2>

>callout
>The Heroku CLI requires **Git**, the popular version control system. If you don't already have Git installed, complete the following before proceeding:
>
> * <a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git" target="_blank">Git installation</a>
> * <a href="https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup" target="_blank">First-time Git setup</a>

In this step, you install the Heroku Command Line Interface (CLI). You use the CLI to manage and scale your applications, provision add-ons, view your recent application logs, and run your application locally.

Download and run the installer for your platform:

<div class="cli-download">
  <div class="text-center">
    <div class="download-wrap">
      <div class="download-column panel">
        <div class="download-title"><img src="/images/cli-apple-logo.svg" class="logo" alt="apple logo" />macOS</div>
        <p>
        <a href="https://cli-assets.heroku.com/heroku.pkg" class="btn btn-primary">Download the installer</a></p>
        <p><sub>Also available via Homebrew:</sub></p>
        <pre class=" language-term"><code class=" language-term"><span class="token input"><span class="token prompt">$ </span>brew install heroku/brew/heroku</span></code></pre>
      </div>
      <div class="download-column panel">
        <div class="download-title"><img src="/images/cli-windows-logo.svg" class="logo" alt="windows logo"/>Windows</div>
        <p>Download the appropriate installer for your Windows installation:</p>
        <p>
        <a href="https://cli-assets.heroku.com/heroku-x64.exe" class="btn btn-primary">64-bit installer</a></p>
        <p><a href="https://cli-assets.heroku.com/heroku-x86.exe" class="btn btn-primary">32-bit installer</a></p>
      </div>
    </div>
    <div class="download-wrap">
      <div class="download-column panel">
        <div class="download-title"><img src="/images/cli-ubuntu-logo.svg" class="logo" alt="ubuntu logo" />Ubuntu 16+</div>
        <p>Run the following from your terminal:</p>
        <pre class=" language-term"><code class=" language-term"><span class="token input"><span class="token prompt">$ </span>sudo snap install heroku --classic</span></code></pre>
        <p><sub><a href="https://snapcraft.io">Snap is available on other Linux OS's as well</a>.
</sub></p>
      </div>
    </div>
  </div>
</div>

After installation completes, you can use the `heroku` command from your terminal.

<div class="only-windows">On Windows, start the Command Prompt (cmd.exe) or Powershell to access the command shell.</div>

Use the `heroku login` command to log in to the Heroku CLI:

```term
$ heroku login
heroku: Press any key to open up the browser to login or q to exit
 ›   Warning: If browser does not open, visit
 ›   https://cli-auth.heroku.com/auth/browser/***
heroku: Waiting for login...
Logging in... done
Logged in as me@example.com
```

This command opens your web browser to the Heroku login page to complete authentication. If your browser is already logged in to Heroku, click the **`Log in`** button displayed on the page.

Both the `heroku` and `git` commands require this authentication to work correctly.

If you’re behind a firewall that requires a proxy to connect with external HTTP/HTTPS services, [set the `HTTP_PROXY` or `HTTPS_PROXY` environment variables](articles/using-the-cli#using-an-http-proxy) in your local development environment before running the `heroku` command.

<h2 data-next-message="I cloned the example and understand Procfiles">Prepare the App</h2>

In this step, you clone a sample application and prepare to deploy it to Heroku.

>callout
>If you're new to Heroku, it's recommended to complete
>this tutorial using the Heroku-provided sample application.
>
>If you have your own application that you want to deploy
>instead, see <a href="https://devcenter.heroku.com/articles/preparing-a-codebase-for-heroku-deployment" target="_blank">Preparing a Codebase for Heroku Deployment</a>.

Create a local copy of the sample app by executing the following commands in your local command shell or terminal:


```term
:::>- $ git clone https://github.com/heroku/java-getting-started
:::>- $ cd java-getting-started
:::-- $ git fetch
:::-- $ git merge origin/main
```

This functioning Git repository contains a simple Java application. The application includes a `Procfile`, a special plaintext file used by Heroku apps. You explicitly declare the processes and commands used to start your app in this file.

The `Procfile` in the example app source code looks like this:

```yaml
:::-> $ cat Procfile
```

This file declares a single process type, `web`, and the command needed to run it. The name `web` is important. It declares that this process type attaches to Heroku's [HTTP routing](http-routing) stack, and is able to receive web traffic.

Procfiles can contain additional process types. For example, you can declare a background worker that processes items off a queue. This tutorial doesn't cover include other processes but you can refer to [The Procfile](procfile) and [The Process Model](process-model) for more info.

The example app also includes a `pom.xml` file, which is used by Java's dependency manager, Maven. The next step covers how to use this file to declare dependencies. 

<h2 data-next-message="I inspected the app dependencies">Declare App Dependencies</h2>

Heroku automatically identifies an app as a Java app if it contains a `pom.xml` file in the root directory. When a Java app is detected, Heroku adds the official Java buildpack to your app, which installs the dependencies for your application. You can create a `pom.xml` file for your own apps with the `mvn archetype:generate` command.

The example app you deployed already has a `pom.xml` ([see it here](https://github.com/heroku/java-getting-started/blob/main/pom.xml)). Here's an excerpt:

```xml
:::-> $ sed -n '27,35p' pom.xml
```

When deploying an app, Heroku reads this file and installs the dependencies by running `mvn clean install`. Take a look at the dependencies listed in your `pom.xml`. 

Another file, `system.properties`, indicates the version of Java to use. The contents of this optional file look like:

```
:::-> $ cat system.properties
```

Heroku supports many [different versions](java-support#supported-java-versions). You can push your own apps using a different version of Java.

<h2 data-next-message="I deployed my app on Heroku">Deploy the App</h2>

Create an app on Heroku to prepare it to receive your source code for deployment:

```term
:::>> $ heroku create
```

This command both creates an app and a Git remote (named `heroku`) associated with your local Git repository.

By default, Heroku generates a random name for your app. You can pass a parameter to specify your own app name.

>callout
>If you create your app via the Heroku Dashboard instead of using the CLI command, add a remote to your local repo with `heroku git:remote --app example-app`.

Now deploy your code:

```term
:::>- $ git push heroku main
:::-> | (head -6; echo "..."; tail -18)
```

By default, your app deploys on a free dyno. A dyno is a lightweight Linux container that runs the command specified in your `Procfile`. After deployment, ensure that you have one `web` [dyno](dynos) running the app. You can check how many dynos are running using the `heroku ps` command:

```term
:::>> $ heroku ps
```

The running `web` dynos serve requests. Visit the app at the URL generated by its app name. As a handy shortcut, you can open the website with:

```term
:::>- $ heroku open
```

Free dynos sleep after thirty minutes of inactivity (for example, if they don't receive any traffic). This behavior causes a delay of a few seconds for the first request upon waking. Subsequent requests perform normally. Free dynos consume from a monthly, account-level quota of [free dyno hours](free-dyno-hours). As long as you haven't exhausted the quota, your free apps can continue to run.

To avoid dyno sleeping, upgrade to a hobby or professional dyno type as described in [Dyno Types](dyno-types). 

<h2 data-next-message="I know how to scale my app">Scale the App</h2>

Horizontal scaling an application on Heroku is equivalent to changing the number of running dynos. 

Scale the number of web dynos to zero:

```term
:::>- $ heroku ps:scale web=0
```

Access the app again by refreshing your browser or running `heroku open`. You get an error message because your app no longer has any web dynos available to serve requests.

Scale it up again:

```term
:::>- $ heroku ps:scale web=1
```

To prevent abuse, scaling a non-free application to more than one dyno requires [account verification](account-verification).

>callout
>You can also vertically scale your app by upgrading to larger dynos. See [Dyno Types](dyno-types) and [Scaling Your Dyno Formation](scaling) for more info.

<h2 data-next-message="I learned how to see my logs">View Logs</h2>

Heroku aggregates all output streams from both your app and the platform's components into a single channel of time-ordered logs.

View information about your running app using the `heroku logs --tail` command:

```term
:::>- background.start("heroku logs --tail", name: "tail", wait: "State changed from starting to up", timeout: 45)
:::-> | tail -10
:::-- background.stop(name: "tail")
```

Visit your application in the browser again to generate another log message.

Press `CTRL+C` to stop streaming logs.

By default, Heroku stores your app's 1500 most recent log lines. You can provision a [logging add-on](https://elements.heroku.com/addons/#logging) or implement your own log drain for long-term storage. In the next step, you add a logging add-on to your app.

<h2 data-next-message="I used an add-on">Provision Add-ons</h2>

Add-ons are cloud services that provide additional services for your application, such as databases, logging, and monitoring.

Several logging add-ons are available that provide features such as log persistence, search, and alerting. [Papertrail](papertrail) is one such add-on with a free plan.

Provision the add-on like so:

```term
:::>> $ heroku addons:create papertrail
```

>callout
>To help prevent abuse, provisioning an add-on requires [account verification](account-verification). If your account hasn't been verified, `heroku addons:create` directs to visit the [verification site](https://heroku.com/verify).

This command provisions the add-on and configures it for your application. To see this particular add-on in action, visit your application's Heroku URL a few times. Each visit generates more log messages, which routes to the Papertrail add-on. Visit the Papertrail console to see the log messages:

```term
:::>- $ heroku addons:open papertrail
```

Your browser opens up a Papertrail web console that shows the latest log events. The interface lets you search and set up alerts:

![Image](https://s3.amazonaws.com/heroku-devcenter-files/article-images/2205-imported-1443570572-2205-imported-1443555048-360-original.jpg 'add-on sample output')

You can list all of your app's active add-ons like so:

```term
:::>- $ heroku addons
```

Running this command for your sample app lists its Papertrail and Heroku Postgres add-ons. Heroku automatically provisions a Postgres database add-on with all Java app deploys. You learn how to use this database in the next step.

<h2 data-next-message="I understand how to use a database">Use a Database</h2>

Heroku provides managed data services for Postgres and Redis, and the [add-on marketplace](https://elements.heroku.com/addons/categories/data-stores) provides additional data services, including MongoDB and MySQL.

Heroku provisions a Heroku Postgres add-on on the free `hobby-dev` plan automatically with all Java app deploys.

Use the `heroku addons` command for an overview of the database provisioned for your app:

```term
:::>> $ heroku addons
```

Listing your app's config vars displays the URL that your app uses to connect to the database (`DATABASE_URL`):

```term
:::>> $ heroku config
```

The `heroku pg` command provides more in-depth information on your app's Heroku Postgres databases:

```term
:::>> $ heroku pg
```

Running this command for your app indicates that the app has a `Hobby-dev` Postgres database (the free plan), currently with zero rows of data.

The example app you deployed already has database functionality, which you can reach by visiting your app's `/db` path. For example, if your app's root URL is `https://example-app-287.herokuapp.com/` then visit `https://example-app-287.herokuapp.com/db`.

You see something like this:

```
Database Output
* Read from DB: 2014-08-08 14:48:25.155241
* Read from DB: 2014-08-08 14:51:32.287816
* Read from DB: 2014-08-08 14:51:52.667683
```

Assuming that you have [Postgres installed locally](heroku-postgresql#local-setup), use the `heroku pg:psql` command to connect to the remote database and see all the rows:

```term
$ heroku pg:psql
psql (10.1, server 9.6.10)
SSL connection (protocol: TLSv1.2, cipher: ECDHE-RSA-AES256-GCM-SHA384, bits: 256, compression: off)
Type "help" for help.

DATABASE=> SELECT * FROM ticks;
            tick
----------------------------
2018-03-01 20:53:27.148139
2018-03-01 20:53:29.288995
2018-03-01 20:53:29.957118
2018-03-01 21:07:28.880162
(4 rows)
=> \q
```

>callout
>The following info illustrates how the example app implements its database functionality. Don't make changes to your example app code in this step.

The code in the example app looks like this:

```java
:::-> $ sed -n '45,50p;78,109p' src/main/java/com/example/Main.java
```

This method adds a new row to the `tick` table when you access your app using the `/db` route. It then returns all rows to render in the output.

The `spring.datasource.url` shown in example app code refers to the configuration value defined in `src/main/resources/application.properties`. The HikariCP database connection pool initializes with this value.

The example app has `spring.datasource.url` set to the value in the `JDBC_DATABASE_URL` to establish a pool of connections to the database:

```
:::-> $ sed -n '1p' src/main/resources/application.properties
```

The official Heroku Java buildpack that's automatically added to your app [sets this `JDBC_DATABASE_URL`](connecting-to-relational-databases-on-heroku-with-java#using-the-jdbc_database_url) environment variable. This variable is dynamic and doesn't appear in your list of configuration variables when running `heroku config`. You can view it by running the following command:

```term
$ heroku run echo \$JDBC_DATABASE_URL
```

Read more about [Heroku PostgreSQL](heroku-postgresql). You can also install [MongoDB, Redis, or other data add-ons](https://elements.heroku.com/addons/categories/data-stores) via `heroku addons:create`.

<h2 data-next-message="I prepared the local environment">Prepare the Local Environment</h2>

In the following steps, you learn how to work with your app locally and push changes to Heroku. Begin by installing your dependencies locally in this step.

Ensure that you have Maven installed before running `mvn clean install` in your local directory. This command installs the dependencies, preparing your system to run the app locally. 

```term
:::>- $ mvn clean install
:::-> | (echo "..."; tail -7)
```

>callout
>If you don't have Maven installed, or get an error like `'mvn' is not recognized as an internal or external command`, use the following wrapper command instead. Run `mvnw clean install` on Windows or `./mvnw clean install` on Mac and Linux. This command both installs Maven and runs the Maven command.

The Maven process compiles and builds a JAR, with dependencies, placing it into your application's `target` directory. The `spring-boot-maven-plugin` in the `pom.xml` provides this process.

If you aren't using Spring in your app, add the following plugin configuration in the `pom.xml` file.

```xml
<plugin>
  <artifactId>maven-assembly-plugin</artifactId>
  <version>3.0.0</version>
  <configuration>
    <descriptorRefs>
      <descriptorRef>jar-with-dependencies</descriptorRef>
    </descriptorRefs>
    <finalName>helloworld</finalName>
  </configuration>
</plugin>
```

After installing dependencies, you can run your app locally. However, the `/db` route doesn't work as you must connect to a database. If you want to access the `/db` route when running locally, create a local Postgres database and update your local `.env` file. `heroku local`, the command used to run apps locally, automatically sets up your environment based on the `.env` file in your app's root directory. Set the `JDBC_DATABASE_URL` environment variable with your local Postgres database's connection string:

```
JDBC_DATABASE_URL=jdbc:postgresql://localhost:5432/java_database_name
```
Your local environment is now ready to run your app and connect to the database.

<h2 data-next-message="I can run my app locally">Run the App Locally</h2>

Ensure you've already run `mvn clean install` before running your app locally.

Start your application locally with the [`heroku local` CLI command](heroku-local):

```term
:::>- background.start("heroku local web", name: "local1", wait: "Tomcat started", timeout: 75)
:::-> | (echo "..."; tail -4)
:::-- background.stop(name: "local1")
```

Just like the Heroku platform, `heroku local` examines your `Procfile` to determine what command to run.

Open [http://localhost:5000](http://localhost:5000) with your web browser to see your app running locally.

If you want to access the app's `/db` route locally, ensure that your local Postgres database is running before you visit the URL.

To stop the app from running locally, go back to your terminal window and press `CTRL+C` to exit.

<h2 data-next-message="I can push local changes">Push Local Changes</h2>

In this step, you make local changes to your app and deploy them to Heroku. Add the following dependency and some code that uses it.

Modify `pom.xml` to include a dependency for `jscience` by adding the following code inside the `<dependencies>` element:

```xml
:::>> file.append pom.xml#28
<dependency>
  <groupId>org.jscience</groupId>
  <artifactId>jscience</artifactId>
  <version>4.3.1</version>
</dependency>
```

Add the following `import` statements to `src/main/java/com/example/Main.java` to import the library:

```java
:::>> file.append src/main/java/com/example/Main.java#19
import static javax.measure.unit.SI.KILOGRAM;
import javax.measure.quantity.Mass;
import org.jscience.physics.model.RelativisticModel;
import org.jscience.physics.amount.Amount;
```

Add the following `hello ` method to `Main.java` to use the library:

```java
:::>> file.append src/main/java/com/example/Main.java#59
@RequestMapping("/hello")
String hello(Map<String, Object> model) {
    RelativisticModel.select();
    Amount<Mass> m = Amount.valueOf("12 GeV").to(KILOGRAM);
    model.put("science", "E=mc^2: 12 GeV = " + m.toString());
    return "hello";
}
```

Finally, create a `src/main/resources/templates/hello.html` file with these contents:

```xml
:::>> file.write src/main/resources/templates/hello.html
<!DOCTYPE html>
<html xmlns:th="http://www.thymeleaf.org" th:replace="~{fragments/layout :: layout (~{::body},'hello')}">
<body>
  <div class="container">
    <p th:text="${science}"/>
  </div>
</body>
</html>
```

[Here's the final source code](https://github.com/heroku/java-getting-started/blob/localchanges/src/main/java/com/example/Main.java) for `Main.java`. Ensure that your changes look similar. [Here's a diff](https://github.com/heroku/java-getting-started/compare/localchanges) of all the local changes made.

Test your changes locally:

```term
:::>- $ mvn clean install
:::-> | (echo "..."; tail -7)
:::>- background.start("heroku local web", name: "local2", wait: "Tomcat started", timeout: 75)
:::-> | (echo "..."; tail -4)
:::-- background.stop(name: "local2")
```

Visiting your application's `/hello` path at [http://localhost:5000/hello](http://localhost:5000/hello), which displays some scientific conversions:

    E=mc^2: 12 GeV = (2.139194076302506E-26 ± 1.4E-42) kg

After testing, deploy your changes. Almost every Heroku deployment follows this same pattern. First, use the `git add` command to stage your modified files for commit:

```term
:::>- $ git add .
```

Next, commit the changes to the repository:

```term
:::>- $ git commit -m "Demo"
```

Now deploy, just as you did previously:

```term
:::>- $ git push heroku main
```

Finally, check that your updated code successfully deployed by opening your browser to that route:

```term
:::>- $ heroku open hello
```

<h2 data-next-message="I understand config vars">Define Config Vars</h2>

Heroku lets you externalize your app's configuration by storing data such as encryption keys or external resource addresses in [config vars](config-vars).

At runtime, config vars are exposed to your app as environment variables. For example, modify `src/main/java/com/example/Main.java` so that the method obtains an energy value from the `ENERGY` environment variable:

```
:::-- $ sed -e '56,68d' src/main/java/com/example/Main.java
```

```java
:::>> file.append("src/main/java/com/example/Main.java#56")
@RequestMapping("/hello")
String hello(Map<String, Object> model) {
    RelativisticModel.select();
    String energy = System.getenv().get("ENERGY");
    if (energy == null) {
       energy = "12 GeV";
    }
    Amount<Mass> m = Amount.valueOf(energy).to(KILOGRAM);
    model.put("science", "E=mc^2: " + energy + " = "  + m.toString());
    return "hello";
}
```

Recompile the app to integrate this change by running `mvn clean install`.

`heroku local` automatically sets up your local environment based on the `.env` file in your app's root directory. Your sample app already includes a `.env` file with the following contents:

```
ENERGY=20 GeV
```

Your local `.env` file also includes the `JDBC_DATABASE_URL` variable if you set it during the [Run the App Locally](#run-the-app-locally) step.

>warning
>Don't commit the `.env` file to version control as it often includes secure credentials. Include `.env` in your repo's `.gitignore` file. The sample app repo only includes a `.env` file as an example for this tutorial step.

Run the app with `heroku local` and visit [http://localhost:5000/hello](http://localhost:5000/hello) to see the conversion value for 20 GeV.

Now that you know it works as expected locally, set this variable as a config var on your app running on Heroku. Execute the following:

```term
:::>> $ heroku config:set ENERGY="20 GeV"
```

View the app's config vars using `heroku config` to verify you've done it correctly:

```term
:::>> $ heroku config
```

Deploy your local changes to Heroku and visit the `/hello` route to see your changes in action:

```term
$ git add .
$ git commit -m "Demo"
$ git push heroku main
$ heroku open hello
```

<h2 data-next-message="I ran a console and shut down the one-off dyno">Start a One-off Dyno</h2>

The `heroku run` command lets you run maintenance and administrative tasks on your app in a [one-off dyno](one-off-dynos). It also lets you launch a REPL process attached to your local terminal for experimenting in your app's environment or your deployed application code:

```term
:::>- $ heroku run java -version
:::-> | tail -4
```

If you receive an error, `Error connecting to process`, [configure your firewall](one-off-dynos#timeout-awaiting-process).

Remember to type `exit` to exit the shell and terminate the dyno.

## Next Steps

Congratulations! You now know how to deploy an app, change its configuration, scale it, view logs, attach add-ons, and run it locally.

Here's some recommended reading to continue your Heroku journey:

* [How Heroku Works](how-heroku-works) provides a technical overview of the concepts encountered while writing, configuring, deploying, and running apps.
* The [Java category](/categories/java-support) provides more in-depth information on developing and deploying Java apps.
* The [Deployment category](/categories/deployment) provides a variety of powerful integrations and features to help streamline and simplify your deployments.
