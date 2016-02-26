<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>
  <#include "nav.ftl">

  <div class="jumbotron text-center">
      <div class="col-md-6">
        <h3><a type="button" class="btn btn-lg btn-default" href="/protected/search" class="button">
           <span class="glyphicon glyphicon-eye-open"></span>
           Je cherche une place</a>
        </h3>
      </div>
      <div class="col-md-6">
        <h3>
          <a type="button" class="btn btn-lg btn-default" href="/protected/sharePlace">
            <span class="glyphicon glyphicon-log-out"></span>
            Je lib&egrave;re ma place
          </a>
        </h3>
      </div>
  </div>
    
    
    <nav class="navbar navbar-default navbar-fixed-bottom">
      <div class="container">
      	<p class="navbar-text">
          DISCLAIMER : this application is of any utility if not working in the target organization.
        </p>
      </div>
    </nav>

</body>
</html>
