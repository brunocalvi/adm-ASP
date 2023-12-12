<!--#include file="../connections/conexao.asp"-->
<!--#include file="funcoes.asp"--> 
<!--#include file="FuncaoUpload.asp"-->
<!--#include file="valida.asp"--> 

<%
Function ZerosEsquerda(Num,tam)
	Dim Zero
	Num = Trim(Num)
	Zero = ""
	For i = Len(Num) To tam - 1
	    Zero = "0" & Zero
	Next
	ZerosEsquerda = Trim(Zero & Num)
End Function

' Chamando Fun��es, que fazem o Upload funcionar
byteCount = Request.TotalBytes
RequestBin = Request.BinaryRead(byteCount)
Set UploadRequest = CreateObject("Scripting.Dictionary")
BuildUploadRequest RequestBin

'RECEBENDO DADOS DOS FORMUL�RIOS
'opc         = UploadRequest.Item("opc").Item("Value")
cod         = UploadRequest.Item("hfcod").Item("Value")
botao       = UploadRequest.Item("botao").Item("Value")

curso       = UploadRequest.Item("curso").Item("Value")
anexo       = UploadRequest.Item("anexo").Item("Value")
texto       = UploadRequest.Item("texto").Item("Value")
modulo      = UploadRequest.Item("ds_modulo").Item("Value")

'La�o que efetua toda operacao do anexo.

	'Recuperando os Dados Digitados ----------------------

	caminho     = UploadRequest.Item("arquivo").Item("FileName")
	nome        =  Right(caminho,Len(caminho)-InstrRev(caminho,"\"))
	arquivo     = UploadRequest.Item("arquivo").Item("Value")
'TESTANDO SE FOI SELECIONADO ALGUM ARQUIVO E 
	if trim(arquivo) <> "" then
        pasta = Server.MapPath("upload/")
        arq = year(date)&month(date)&day(date)&hour(now)&minute(now)&second(now)&"."&right(nome,3)

		nome_arquivo = arq
		nome_arquivo = "/"&nome_arquivo
		'Response.Write x & "<br>"
		if x = 1 then
			arquivo = arq
			
		else
			arquivo = arquivo & "�" & arq
		end if
		Set ScriptObject = Server.CreateObject("Scripting.FileSystemObject")
		Set MyFile = ScriptObject.CreateTextFile(pasta & nome_arquivo)
		'Response.Write x & "-"& nome_arquivo & "<br>"
		For i = 1 to LenB(arquivo)
		MyFile.Write chr(AscB(MidB(arquivo,i,1)))
		Next
		MyFile.Close
		arquivo = ""
	end if

response.write texto &"<br>"
response.write "<a href='upload/"&arq&"' target='_blank'>Anexo</a>"

session.LCID = 1046


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