<!--#include file="../connections/conexao.asp"--> 
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<br><br>
<div class="alert alert-primary" role="alert">
  Olá <%= session("usr") %>, <br>seja bem-vindo ao Curso de Desenvolvimento Web
</div>

<br><br>
<%
'TESTANDO SE EXISTE MENSAGEM NA TABELA DE CONTATO

sql = "SELECT * FROM tb_contato ORDER BY cd_contato "
set rs = conexao.execute(sql)

if not rs.eof then
%>

<div class="alert alert-primary" role="alert">
  Nova(s) Mensagem(s)<br>
  <% do while not rs.eof %>  
  <%= rs("nome") %> - <%= rs("assunto") %><br>
  <% rs.movenext
      loop
  %>
</div>

<% end if %>

<!--#include file="includes/footer.asp"--> 