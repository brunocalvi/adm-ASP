<%
'on error resume next
' Consulta
'Server.ScriptTimeout = 100000
 Session.Timeout = 60

'response.Write(session("usr"))
sql = "SELECT cd_usuario,ds_usuario,senha FROM tb_usuario WHERE senha='"&session("snh")&"' AND ds_usuario = '"&session("usr")&"'"
'response.write sql
set rs_val = conexao.execute(sql)


if rs_val.eof then
%>	
<script>
  alert("Sessção expirada, favor logar novamente.")
   parent.location = "index.html"
</script>
<%
session("usr") = ""
session("snh") = ""
'response.end
end if
%>
 
