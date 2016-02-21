<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>
  <#include "nav.ftl">
  
  <div class="jumbotron">
    <div class="container">
      <div class="row></div>
      <form method="post" action="/login/process" role="form">
        <div class="form-group">
	        <label for="email">Email</label>
	        <input type="email class="form-control" id="email"/>
        </div>
        <div class="form-group">
	        <label for="pwd">Mot de passe</label>
	        <input type="password" class="form-control" id="pwd"/>
        </div>
      </form>
      </div>
    </div>
  </div>

Passe ton chemin
</body>
</html>
