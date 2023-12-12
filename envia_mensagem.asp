<!--#include file="connections/conexao.asp" -->

<%
'RECEBENDO DO FORM
nome       = request.form("nome")
email      = request.form("email")
assunto    = request.form("assunto")
menssagem  = request.form("menssagem")

'INSERT DAS INFORMACOES NO BD
sql = "INSERT INTO tb_contato (nome, email, assunto, mensagem) VALUES('"& nome &"', '"& email &"', '"& assunto &"', '"& menssagem &"')"
conexao.execute(sql)
%>

<script>
  alert("Menssagem salva com sucesso !");
  parent.location = "index.asp";
</script>

