<!--#include file="../connections/conexao.asp"--> 
<!--#include file="funcoes.asp"--> 
<!--#include file="valida.asp"--> 

<%
session.LCID = 1046
'RECEBENDO CAMPOS DO FORMULORIO
opc          = request.querystring("opc")
botao        =  request.form("botao")
cod          =  request.form("hfcod")

nome              = request.form("nome")
cpf               = request.form("cpf")
data_nascimento   = request.form("data_nascimento")
endereco          = request.form("endereco")
cidade            = request.form("cidade")
curriculo         = request.form("curriculo")
email             = request.form("email")

if botao = "Incluir" then
'INCLUINDO OS DADOS RECEBIDOS NA TABELA

  sql = "INSERT INTO tb_professor (ds_professor, cpf, data_nascimento, endereco, cidade, curriculo, email)"
  sql = sql & " VALUES('"& nome &"','"& cpf &"','"& data_banco(data_nascimento) &"','"& endereco &"','"& cidade &"','"& curriculo &"','"& email &"')"
  'response.write sql
  'response.end
  conexao.execute(sql)
%>
<script>
    alert("Dados incluido com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
elseif botao = "Alterar" then
'ALTERANDO OS DADOS RECEBIDOS NA TABELA

  sql = "UPDATE tb_professor SET"
  sql = sql & " ds_professor = '"& nome &"',"
  sql = sql & " cpf = '"& cpf &"',"  
  sql = sql & " data_nascimento = '"& data_banco(data_nascimento) &"',"  
  sql = sql & " endereco = '"& endereco &"',"  
  sql = sql & " cidade = '"& cidade &"',"  
  sql = sql & " curriculo = '"& curriculo &"',"  
  sql = sql & " email = '"& email &"'"  
  sql = sql & " WHERE cd_professor = "& cod

'response.write sql
'response.end

  conexao.execute(sql)
%>

<script>
    alert("Dados alterado com sucesso!")
    parent.location = "cst_professor.asp"
</script>

<%
elseif opc <> "" then
'DELETANDO REGISTRO SELECIONADO
  cod = request.querystring("cod")
  sql = "DELETE FROM tb_professor WHERE cd_professor ="& cod

  'response.write sql
  'response.end

  conexao.execute(sql)
%>
<script>
    alert("Professor excluido com sucesso!")
    parent.location = "cst_professor.asp"
</script>
<%
end if
%>