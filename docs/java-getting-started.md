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
  https://github.com/heroku/java-getting-started/blob/master/java-getting-started.md

  Command:
  $ rundoc build --path java-getting-started.md
-->

<h2 data-next-message="I'm ready to start">Introduction</h2>

This tutorial will have you deploying a Java app in minutes.

Hang on for a few more minutes to learn how it all works, so you can make the most out of Heroku.

The tutorial assumes that you already have:

* A free <a href="https://signup.heroku.com/signup/dc" target="_blank">Heroku account</a>
* <a href="http://www.oracle.com/technetwork/java/javase/downloads/index.html" target="_blank">Java 8</a> installed
* <a href="http://maven.apache.org/download.html" target="_blank">Maven 3</a> installed

If you'd prefer to use Gradle instead of Maven, please see the [Getting Started with Gradle on Heroku](getting-started-with-gradle-on-heroku) guide.

<h2 data-next-message="I have installed the Heroku CLI">Set up</h2>

>callout
>The Heroku CLI requires **Git**, the popular version control system. If you don't already have Git installed, complete the following before proceeding:
>
> * <a href="https://git-scm.com/book/en/v2/Getting-Started-Installing-Git" target="_blank">Git installation</a>
> * <a href="https://git-scm.com/book/en/v2/Getting-Started-First-Time-Git-Setup" target="_blank">First-time Git setup</a>

In this step you'll install the Heroku Command Line Interface (CLI). You use the CLI to manage and scale your applications, provision add-ons, view your application logs, and run your application locally.

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

When installation completes, you can use the `heroku` command from your terminal.

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

This command opens your web browser to the Heroku login page. If your browser is already logged in to Heroku, simply click the **Log in** button displayed on the page.

This authentication is required for both the `heroku` and `git` commands to work correctly.

Note that if you’re behind a firewall that requires use of a proxy to connect with external HTTP/HTTPS services, [you can set the `HTTP_PROXY` or `HTTPS_PROXY` environment variables](articles/using-the-cli#using-an-http-proxy) in your local development environment before running the `heroku` command.

<h2 data-next-message="I cloned the app source code">Prepare the app</h2>

In this step, you will prepare a sample application that's ready to be deployed to Heroku.

>callout
>If you are new to Heroku, it is recommended that you
>complete this tutorial using the Heroku-provided sample application.
>
>However, if you have your own existing application that you want to deploy
>instead, see <a href="https://devcenter.heroku.com/articles/preparing-a-codebase-for-heroku-deployment" target="_blank">this article</a>
>to learn how to prepare it for Heroku deployment.

To create a local copy of a sample app that you can deploy to Heroku, execute the following commands in your local command shell or terminal:


```term
:::>- $ git clone https://github.com/heroku/java-getting-started
:::>- $ cd java-getting-started
:::-- $ git fetch
:::-- $ git merge origin/master
```

You now have a functioning Git repository that contains a simple Java application. The application includes a `pom.xml` file, which is used by Java's dependency manager, Maven.

<h2 data-next-message="I have deployed my app on Heroku">Deploy the app</h2>

In this step you'll deploy the sample app to Heroku.

First, create an app on Heroku, which prepares Heroku to receive your source code:

```term
:::>> $ heroku create
```

When you create an app, a Git remote (named `heroku`) is also created and associated with your local Git repository.  

By default, Heroku generates a random name (in this case `warm-eyrie-9006`) for your app. You can pass a parameter to specify your own app name.

Now deploy your code:

```term
:::>- $ git push heroku master
:::-> | $ (head -6; echo "..."; tail -18)
```

The application is now deployed. Ensure that at least one instance of the app is running:

```term
:::>- $ heroku ps:scale web=1
```

Now visit the app at the URL generated by its app name. As a handy shortcut, you can open the website like so:

```term
:::>- $ heroku open
```

<h2 data-next-message="I've learned how to see my logs">View logs</h2>

Heroku aggregates all of the output streams from both your app and the platform's components into a single channel of time-ordered logs.

View information about your running app using the `heroku logs --tail` command:

```term
:::>- background.start("heroku logs --tail", name: "tail", wait: "State changed from starting to up", timeout: 45)
:::-> | tail -10
:::-- background.stop(name: "tail")
```

Visit your application in the browser again to generate another log message.

Press `CTRL+C` to stop streaming logs.

<h2 data-next-message="I know what a Procfile is">Define a Procfile</h2>

Heroku apps use a special plaintext file called the [Procfile](procfile) to explicitly declare what command should be executed to start your app.

The `Procfile` in the example app you deployed looks like this:

```yaml
:::-> $ cat Procfile
```

This declares a single process type, `web`, and the command needed to run it. The name `web` is important here. It declares that this process type will be attached to Heroku's [HTTP routing](http-routing) stack, and it will be able to receive web traffic.

Procfiles can contain additional process types. For example, you might declare one for a background worker that processes items off of a queue.

<h2 data-next-message="I know how to scale my app">Scale the app</h2>

Right now, your app is running on a single web [dyno](dynos). A dyno is a lightweight Linux container that runs the command specified in your `Procfile`.

You can check how many dynos are running using the `heroku ps` command:

```term
:::>> $ heroku ps
```

By default, your app is deployed on a free dyno. Free dynos sleep after thirty minutes of inactivity (i.e., if they don't receive any traffic).  This causes a delay of a few seconds for the first request upon waking. Subsequent requests will perform normally.

Free dynos consume from a monthly, account-level quota of [free dyno hours](free-dyno-hours). As long as the quota is not exhausted, your free apps can continue to run.

To avoid dyno sleeping, you can upgrade to a hobby or professional dyno type as described in [Dyno Types](dyno-types). For example, if you migrate your app to a professional dyno, you can easily scale it by running a command telling Heroku to spin up a specific number of dynos, each running your web process type.

Scaling an application on Heroku is equivalent to changing the number of dynos that are running.

Scale the number of web dynos to zero:

```term
:::>- $ heroku ps:scale web=0
```

Access the app again by refreshing your browser or running `heroku open`.  You will get an error message because your app no longer has any web dynos available to serve requests.

Scale it up again:

```term
:::>- $ heroku ps:scale web=1
```

To prevent abuse, scaling a non-free application to more than one dyno requires [account verification](account-verification).

<h2 data-next-message="I've installed the app dependencies locally">Declare app dependencies</h2>

Heroku automatically identifies an app as a Java app if it contains a `pom.xml` file in the root directory. You can create a `pom.xml` file for your own apps with the `mvn archetype:create` command.

The demo app you deployed already has a `pom.xml` ([see it here](https://github.com/heroku/java-getting-started/blob/master/pom.xml)). Here's an excerpt:

```xml
:::-> $ sed -n '27,35p' pom.xml
```

The `pom.xml` file specifies dependencies that should be installed with your application.  When an app is deployed, Heroku reads this file and installs the dependencies by running `mvn clean install`.

Another file, `system.properties`, indicates the version of Java to use (Heroku supports many [different versions](java-support#supported-java-versions)). The contents of this optional file are straightforward:

```
:::-> $ cat system.properties
```

Run `mvn clean install` in your local directory to install the dependencies, preparing your system for running the app locally. Note that this app requires Java 8, but you can push your own apps using a different version of Java.

```term
:::>- $ mvn clean install
:::-> | $ (echo "..."; tail -7)
```

If you do not have Maven installed, or get an error like `'mvn' is not recognized as an internal or external command`, then you can use the wrapper command instead by running `mvnw clean install` on Windows or `./mvnw clean install` on Mac and Linux. This both installs Maven and runs the Maven command.

The Maven process compiles and build a JAR, with dependencies, placing it into your application's `target` directory. This process is accomplished with the `spring-boot-maven-plugin` in the `pom.xml`.

If you aren't using Spring in your app, you can accomplish this with the following plugin configuration in the `pom.xml` file.

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

Once dependencies are installed, you can run your app locally.

<h2 data-next-message="I can run my app locally">Run the app locally</h2>

Start your application locally with the `heroku local` CLI command (make sure you've already run `mvn clean install`):

```term
:::>- background.start("heroku local web", name: "local1", wait: "Tomcat started", timeout: 30)
:::-> | $ (echo "..."; tail -4)
:::-- background.stop(name: "local1")
```

Just like the Heroku platform, `heroku local` examines your `Procfile` to determine what command to run.

Open [http://localhost:5000](http://localhost:5000) with your web browser. You should see your app running locally.

To stop the app from running locally, go back to your terminal window and press `CTRL+C` to exit.

<h2 data-next-message="I can push local changes">Push local changes</h2>

In this step you'll learn how to make local changes to your app and deploy them to Heroku. As an example, you'll add a dependency and some code that uses it.

Modify `pom.xml` to include a dependency for `jscience` by adding the following code inside the `<dependencies>` element:

```xml
:::>> file.append pom.xml#28
<dependency>
  <groupId>org.jscience</groupId>
  <artifactId>jscience</artifactId>
  <version>4.3.1</version>
</dependency>
```

Now add the following `import` statements to `src/main/java/com/example/Main.java` to import the library:

```java
:::>> file.append src/main/java/com/example/Main.java#19
import static javax.measure.unit.SI.KILOGRAM;
import javax.measure.quantity.Mass;
import org.jscience.physics.model.RelativisticModel;
import org.jscience.physics.amount.Amount;
```

Add the following `hello ` method to `Main.java`:

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

[Here's the final source code](https://github.com/heroku/java-getting-started/blob/localchanges/src/main/java/com/example/Main.java) for `Main.java` - yours should look similar.  [Here's a diff](https://github.com/heroku/java-getting-started/compare/localchanges) of all the local changes you should have made.

Now test your changes locally:

```term
:::>- $ mvn clean install
:::-> | $ (echo "..."; tail -7)
:::>- background.start("heroku local web", name: "local2", wait: "Tomcat started", timeout: 30)
:::-> | $ (echo "..."; tail -4)
:::-- background.stop(name: "local2")
```

Visiting your application's `/hello` path at [http://localhost:5000/hello](http://localhost:5000/hello), you should see some great scientific conversions displayed:

    E=mc^2: 12 GeV = (2.139194076302506E-26 ± 1.4E-42) kg

Now you can deploy. Almost every Heroku deployment follows this same pattern. First, use the `git add` command to stage your modified files for commit:

```term
:::>- $ git add .
```

Next, commit the changes to the repository:

```term
:::>- $ git commit -m "Demo"
```

Now deploy, just as you did previously:

```term
:::>- $ git push heroku master
```

Finally, check that your updated code is successfully deployed:

```term
:::>- $ heroku open hello
```

<h2 data-next-message="I understand config vars">Define config vars</h2>

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

Now compile the app again so that this change is integrated by running `mvn clean install`.

`heroku local` automatically sets up your local environment based on the contents of the `.env` file in your app's root directory. Your sample app already includes a `.env` file with the following contents:

```
ENERGY=20 GeV
```

>warning
>Your own apps should _not_ commit the `.env` file to version control, because it often includes secure credentials. Include `.env` in your repo's `.gitignore` file.

If you run the app with `heroku local` and visit it at [http://localhost:5000/hello](http://localhost:5000/hello), you'll see the conversion value for 20 GeV.

To set the config var on Heroku, execute the following:

```term
:::>> $ heroku config:set ENERGY="20 GeV"
```

View the config vars that are set using `heroku config`:

```term
:::>> $ heroku config
```

Deploy your updated application to Heroku to see this in action.

<h2 data-next-message="I created a one-off dyno that ran a console">Start a one-off dyno</h2>

The `heroku run` command lets you run maintenance and administrative tasks on your app in a [one-off dyno](one-off-dynos). It can also lets you launch a REPL process attached to your local terminal for experimenting in your app's environment, or code that you deployed with your application:

```term
:::>- $ heroku run java -version
:::-> | $ tail -4
```

If you receive an error, `Error connecting to process`, then you might need to [configure your firewall](one-off-dynos#timeout-awaiting-process).

Don’t forget to type `exit` to exit the shell and terminate the dyno.

<h2 data-next-message="I've used an add-on">Provision add-ons</h2>

Add-ons are cloud services that provide additional services for your application, such as databases, logging, and monitoring.

By default, Heroku stores your app's 1500 most recent log lines. However, the full log stream is available as a service, and several logging add-ons are available that provide features such as log persistence, search, and alerting.

In this step you'll provision one of these logging add-ons, Papertrail.

Provision the [Papertrail](papertrail) add-on like so:

```term
:::>> $ heroku addons:create papertrail
```

>callout
>To help prevent abuse, provisioning an add-on requires [account verification](account-verification). If your account has not been verified, you will be directed to visit the [verification site](https://heroku.com/verify).

The add-on is now deployed and configured for your application. You can list your app's active add-ons like so:

```term
:::>- $ heroku addons
```

To see this particular add-on in action, visit your application's Heroku URL a few times. Each visit generates more log messages, which should now be routed to the Papertrail add-on.  Visit the Papertrail console to see the log messages:

```term
:::>- $ heroku addons:open papertrail
```

Your browser will open up a Papertrail web console that shows the latest log events. The interface lets you search and set up alerts:

![Image](https://s3.amazonaws.com/heroku-devcenter-files/article-images/2205-imported-1443570572-2205-imported-1443555048-360-original.jpg 'add-on sample output')

<h2 data-next-message="I understand how to use a database">Use a database</h2>

Heroku provides managed data services for Postgres and Redis, and the [add-on marketplace](https://elements.heroku.com/addons/categories/data-stores) provides a variety of additional data services, including MongoDB and MySQL.

In this step you'll learn about the free Heroku Postgres add-on that is provisioned automatically with all Java app deploys.

Heroku Postgres is itself an add-on, so you can use the `heroku addons` command for an overview of the database provisioned for your app:

```term
:::>> $ heroku addons
```

Listing your app's config vars will display the URL that your app is using to connect to the database (`DATABASE_URL`):

```term
:::>> $ heroku config
```

The `heroku pg` command provides more in-depth information on your app's Heroku Postgres databases:

```term
:::>> $ heroku pg
```

This indicates that the app has a `Hobby-dev` database (the free plan), running Postgres 9.3.3, currently with zero rows of data.

The example app you deployed already has database functionality, which you can reach by visiting your app's `/db` path. For example, if your app's root URL is `https://wonderful-app-287.herokuapp.com/` then visit `https://wonderful-app-287.herokuapp.com/db`.

The code to access the database is straightforward. Here's the method to insert values into a table called `tick`:

```java
:::-> $ sed -n '45,50p;78,109p' src/main/java/com/example/Main.java
```

This ensures that when you access your app using the `/db` route, a new row is added to the `tick` table, and all rows are then returned so that they can be rendered in the output.

The HikariCP database connection pool is initialized with the configuration value `spring.datasource.url`, which is defined in `src/main/resources/application.properties` like this:

```
:::-> $ sed -n '1p' src/main/resources/application.properties
```

This sets `spring.datasource.url` to the value in the `JDBC_DATABASE_URL` environment variable, [set by the database add-on](articles/connecting-to-relational-databases-on-heroku-with-java), and establishes a pool of connections to the database.

Deploy your changes to Heroku. Now, when you access your app's `/db` route, you will see something like this:

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

Read more about [Heroku PostgreSQL](heroku-postgresql).

A similar technique can be used to install [MongoDB or Redis add-ons](https://elements.heroku.com/addons/categories/data-stores).


## Next steps

Congratulations! You now know how to deploy an app, change its configuration, scale it, view logs, and attach add-ons.

Here's some recommended reading to continue your Heroku journey:

* [How Heroku Works](how-heroku-works) provides a technical overview of the concepts you’ll encounter while writing, configuring, deploying, and running apps.
* The [Java category](/categories/java-support) provides more in-depth information on developing and deploying Java apps.
* The [Deployment category](/categories/deployment) provides a variety of powerful integrations and features to help streamline and simplify your deployments.
