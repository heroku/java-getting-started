<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>
  <#include "nav.ftl">
  
  <div class="jumbotron">
    <div class="container">
      <div class="row form-container">
	      <form method="post" role="form">
	        <div class="form-group">
		        <label for="email">Email</label>
		        <input type="email" class="form-control" id="email" placeholder="adresse@email.fr"/>
	        </div>
	        <div class="form-group">
		        <label for="pwd">Mot de passe</label>
		        <input type="password" class="form-control" id="pwd" placeholder="********"/>
	        </div>
	        <div class="form-group">
		        <label for="pwd">Numéro de place (si attribué)</label>
		        <input type="text" class="form-control" id="place" placeholder="110" size="3" maxlength="3"/>
	        </div>
	        <div class="form-group">
				<input type="submit" class="btn btn-success" value="Valider"/>
	        </div>
	      </form>
      </div>
    </div>
  </div>
  
</body>
</html>
