<!--#include file="../connections/conexao.asp"--> 
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<%
'RECEBENDO CODIGO COMO PARAMETRO E EVT PARA SABER SE VAI INCLUIR OU ALTERAR
cod   = Request.QueryString("cod")
evt   = Request.QueryString("evt")

if cod <> "" then
  cod = cint(cod)
end if

if ucase(evt) = "ALT" then
  sql = "SELECT * FROM tb_professor WHERE cd_professor = "& cod
  'Response.Write(sql)
  'Response.End()

  set professor = conexao.execute(sql)
    nome              = professor("ds_professor") 
    cpf               = professor("cpf") 
    data_nascimento   = professor("data_nascimento") 
    endereco          = professor("endereco") 
    cidade            = professor("cidade") 
    curriculo         = professor("curriculo") 
    email             = professor("email") 

    bot = "Alterar"
else
   bot = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_professor.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Nome:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome" name="nome" value="<%= nome %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="cpf"><b>CPF:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="cpf" name="cpf" value="<%= cpf %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="data_nascimento"><b>Data Nascimento:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="data_nascimento" name="data_nascimento" value="<%= data_nascimento %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="endereco"><b>Endereço:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="endereco" name="endereco" value="<%= endereco %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="cidade"><b>Cidade:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="cidade" name="cidade" value="<%= cidade %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="curriculo"><b>Curriculo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="curriculo" name="curriculo" value="<%= curriculo %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="email"><b>E-mail:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="email" name="email" value="<%= email %>">
      </div>
    </div>

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="Botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%= cod %>">	
  </form>
</div>

<!--#include file="includes/footer.asp"-->  