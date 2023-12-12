<br>
<!--#include file="funcoes.asp"-->
<!--#include file="../connections/conexao.asp"--> 
<!--#include file="valida.asp"--> 

<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMUL�RIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")
usuario      =  request.form("usuario")
senha        =  request.form("senha")

if botao = "Incluir" then
' INCLUINDO OS DADOS RECEBIDOS NA TABELA

   sql = "INSERT INTO tb_usuario (ds_usuario,senha)"
   sql = sql & " VALUES('"&usuario&"','"&senha&"')"
'   response.write sql
'   response.end
   conexao.execute(sql)
%>

<script>
    alert("usuario inclu�do com sucesso!")
    parent.location = "cst_usuario.asp"
</script>

<%
elseif botao = "Alterar" then
' ALTERANDO OS DADOS RECEBIDOS NA TABELA

  sql = "UPDATE tb_usuario SET"
  sql = sql & " ds_usuario = '"&usuario&"',"
  sql = sql & " senha = '"&senha&"'"  
  sql = sql & " WHERE cd_usuario = "&cod 
'response.write sql
'response.end
  conexao.execute(sql)
%>

<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_usuario.asp"
</script>

<%
elseif opc <> "" then
' DELETANDO REGISTRO SELECIONADO
   cod = request.querystring("cod")
   sql = "DELETE FROM tb_usuario WHERE cd_usuario ="&cod
'  response.write sql
'  response.end
   conexao.execute(sql)
%>

<script>
    alert("usuario exclu�do com sucesso!")
    parent.location = "cst_usuario.asp"
</script>

<%
end if
%>