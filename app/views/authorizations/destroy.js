$("table tr#authorization_<%= @authorization.id %>").remove();
$("input#totalregs").attr('value','<%= @authorizations.count %>');