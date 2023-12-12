<!--#include file="../connections/conexao.asp"-->
<!--#include file="funcoes.asp"--> 
<!--#include file="valida.asp"--> 

<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULORIO
opc           = request.querystring("opc")
botao         = request.form("botao")
cod           = request.form("hfcod")

modulo      = request.form("ds_modulo")
curso       = request.form("curso")
texto       = request.form("texto")
anexo       = request.form("anexo")

if botao = "Incluir" then
'INCLUINDO OS DADOS RECEBIDOS NA TABELA

  sql = "INSERT INTO tb_modulo (ds_modulo, texto, anexo, cd_curso)"
  sql = sql & " VALUES('"& modulo &"','"& texto &"','"& anexo &"',"& curso &")"
  'response.write sql
  'response.end
  conexao.execute(sql)
%>

<script>
    alert("Dados incluido com sucesso!")
    parent.location = "cst_modulo.asp"
</script>

<%
elseif botao = "Alterar" then
'ALTERANDO OS DADOS RECEBIDOS NA TABELA

  sql = "UPDATE tb_modulo SET"
  sql = sql & " ds_modulo = '"& modulo &"',"
  sql = sql & " texto = '"& texto &"',"
  sql = sql & " cd_curso = '"& curso &"',"  
  sql = sql & " anexo = '"& anexo &"'"   
  sql = sql & " WHERE cd_modulo = "& cod

'response.write sql
'response.end

  conexao.execute(sql)
%>

<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_modulo.asp"
</script>

<%
elseif opc <> "" then
'DELETANDO REGISTRO SELECIONADO
  cod = request.querystring("cod")
  sql = "DELETE FROM tb_modulo WHERE cd_modulo ="& cod

  'response.write sql
  'response.end

  conexao.execute(sql)
%>
<script>
    alert("modulo excluido com sucesso!")
    parent.location = "cst_modulo.asp"
</script>
<%
end if
%>