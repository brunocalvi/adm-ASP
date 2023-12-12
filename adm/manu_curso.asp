<!--#include file="../connections/conexao.asp"-->
<!--#include file="funcoes.asp"--> 
<!--#include file="valida.asp"--> 

<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULORIO
opc           = request.querystring("opc")
botao         = request.form("botao")
cod           = request.form("hfcod")

professor     = request.form("professor")
ativo         = request.form("ativo")
resumo        = request.form("resumo")
nome_curso    = request.form("nome_curso")

if botao = "Incluir" then
'INCLUINDO OS DADOS RECEBIDOS NA TABELA

  sql = "INSERT INTO tb_curso (ds_curso, ativo, cd_professor, resumo)"
  sql = sql & " VALUES('"& nome_curso &"',"& ativo &","& professor &",'"& resumo &"')"
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("Dados incluido com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
elseif botao = "Alterar" then
'ALTERANDO OS DADOS RECEBIDOS NA TABELA

  sql = "UPDATE tb_curso SET"
  sql = sql & " ds_curso = '"& nome_curso &"',"
  sql = sql & " ativo = "& ativo &","
  sql = sql & " cd_professor = "& professor &","  
  sql = sql & " resumo = '"& resumo &"'"   
  sql = sql & " WHERE cd_curso = "& cod

'response.write sql
'response.end

  conexao.execute(sql)
%>

<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_curso.asp"
</script>

<%
elseif opc <> "" then
'DELETANDO REGISTRO SELECIONADO
  cod = request.querystring("cod")
  sql = "DELETE FROM tb_curso WHERE cd_curso ="& cod

  'response.write sql
  'response.end

  conexao.execute(sql)
%>
<script>
    alert("curso excluido com sucesso!")
    parent.location = "cst_curso.asp"
</script>
<%
end if
%>