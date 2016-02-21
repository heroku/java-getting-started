<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>
  <#include "nav.ftl">

  <div class="container">
    <div class="row">&nbsp;</div>
    <div>
      <div class="col-sm-1"></div>
      <div class="col-sm-10">
      	<#list places as place>
      	  <#if place.free>
      	    <#assign class = "label-success">
      	  <#else>
      	    <#assign class = "label-default">
      	  </#if>
          <span class="col-sm-1"> <a class="label ${class}">${place.number}</a></span>
        </#list>
      </div>
      <div class="col-sm-1"> </div>
    </div>
  </div>

</body>
</html>
