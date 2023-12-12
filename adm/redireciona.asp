<!--#include file="funcoes.asp"-->
<!--#include file="../connections/conexao.asp"-->
<%
usr =  request.form("usuario")
snh =  request.form("senha")
usr = trim(usr)
snh = trim(snh)
usr = replace(usr,"'","")
snh = replace(snh,"'","")

sql = "SELECT cd_usuario,ds_usuario,senha FROM tb_usuario WHERE senha='"&snh&"' AND ds_usuario = '"&usr&"'"
'Response.Write(sql)
'Response.end
set rs = conexao.execute(sql)
'response.write sql
'response.end
if rs.eof then
%>	
<script>
  alert("Usuário não tem acesso.")
   parent.location = "index.html"
</script>
<%
response.end
else
Session.Timeout=60
session("usr")  = usr
session("cd_usuario")  = rs("cd_usuario")
session("snh")  = snh


%>
<%
   response.redirect "inicio.asp" 
end if
%> 