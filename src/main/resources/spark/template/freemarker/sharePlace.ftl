<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
  <link id="bsdp-css" href="/stylesheets/datepicker/datepicker3.css" rel="stylesheet">
  <!--script src="/js/bootstrap-datepicker.fr.js" charset="UTF-8"></script-->
</head>

<body>
  <#include "nav.ftl">


<div class="container">
    <div class="row">
    <form method="post" role="form">
        <div class='col-sm-6'>
           <div class="well text-center">
           			<input type="hidden" name="number" value="${placeNumber}"/>
			        Je lib&egrave;re la place n&deg;<strong>${placeNumber}</strong> pour la (ou les) journ&eacute;e(s) <br/>
			        du <input type="text" class="span2 form-control" value="" data-date-format="dd/mm/yyyy" id="dpd1" length="10" size="10" name="dateDebut"/> au
			         <input type="text" class="span2" value="" data-date-format="dd/mm/yyyy" id="dpd2" length="10" size="10" name="dateFin"/>
			      <br/>
			            <input type="submit" class="btn btn-ok" value="Valider"/>
          </div>
        </div>
	</form>
    </div>
</div>
<script>
	if (top.location != location) {
    top.location.href = document.location.href ;
  }
  
		$(function(){
		$('#dpd1').datepicker();
			$('#dpd1').datepicker();
		
		});
			</script>
</body>
</html>