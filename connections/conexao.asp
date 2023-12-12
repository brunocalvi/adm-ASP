<% 
'Criamos o objeto de conexão
Set conexao = Server.CreateObject("ADODB.Connection") 
 
'Abrimos uma conexão com o banco de dados
conexao.Open("DRIVER={MySQL ODBC 5.3 ANSI Driver};SERVER=;PORT=3306;DATABASE=;USER=;PASSWORD=;OPTION=3;")
 
'response.write "banco conectado" 
 
'Fechamos a conexão com o banco de dados
'conexao.Close()
 
'Destruímos o objeto
'Set conexao = Nothing
%>
