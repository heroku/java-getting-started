<!DOCTYPE html>
<html>
<head>
  <#include "header.ftl">
</head>

<body>

  <#include "nav.ftl">

<div class="container">

  <h1>Database Output</h1>
    <ul>
    <#list results as x>
      <li> ${x} </li>
    </#list>
    </ul>

</div>

</body>
</html>
