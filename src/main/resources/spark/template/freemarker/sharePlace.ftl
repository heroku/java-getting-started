<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
  <script src="/js/bootstrap-datepicker.js"></script>
</head>

<body>
  <#include "nav.ftl">


<div class="container">
    <div class="row">
    <form method="post" role="form">
        <div class='col-sm-6'>
           <div class="well text-center">
           			<input type="hidden" name="number" value="${placeNumber}"/>
			        Je lib&egrave;re la place n°<strong>${placeNumber}</strong> pour la journ&eacute;e du 
			         <input type="text" class="span2" value="02/03/16" data-date-format="dd/mm/yy" id="dpd1" length="10" size="10" name="dateDebut"/> au
			         <input type="text" class="span2" value="02/03/16" data-date-format="dd/mm/yy" id="dpd2" length="10" size="10" name="dateFin"/>
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
		//http://www.eyecon.ro/bootstrap-datepicker/
			window.prettyPrint && prettyPrint();

			$('#dp2').datepicker();

	
        // disabling dates
        var nowTemp = new Date();
        var now = new Date(nowTemp.getFullYear(), nowTemp.getMonth(), nowTemp.getDate(), 0, 0, 0, 0);

        var checkin = $('#dpd1').datepicker({
          onRender: function(date) {
            return date.valueOf() < now.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          if (ev.date.valueOf() > checkout.date.valueOf()) {
            var newDate = new Date(ev.date)
            newDate.setDate(newDate.getDate() + 1);
            checkout.setValue(newDate);
          }
          checkin.hide();
          $('#dpd2')[0].focus();
        }).data('datepicker');
        var checkout = $('#dpd2').datepicker({
          onRender: function(date) {
            return date.valueOf() <= checkin.date.valueOf() ? 'disabled' : '';
          }
        }).on('changeDate', function(ev) {
          checkout.hide();
        }).data('datepicker');
		});
			</script>
</body>
</html>