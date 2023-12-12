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
  sql = "SELECT * FROM tb_modulo WHERE cd_modulo = "& cod
  'Response.Write(sql)
  'Response.End()

  set modulo = conexao.execute(sql)
    ds_modulo   = modulo("ds_modulo") 
    curso       = modulo("cd_curso") 
    texto       = modulo("texto") 
    anexo       = modulo("anexo") 

    bot = "Alterar"
else
   bot = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_modulo.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="ds_modulo"><b>Modulo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="ds_modulo" name="ds_modulo" value="<%= ds_modulo %>">
      </div>
    </div>

    <% 
    sql = "SELECT * FROM tb_curso ORDER BY ds_curso"
    set curso = conexao.execute(sql)
    %>

    <div class="form-group">
      <label class="control-label col-sm-2" for="curso"><b>Curso:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="curso" id="curso">

          <% do while not curso.eof %>
          <option value="<%= curso("cd_curso") %>"><%= curso("ds_curso") %></option>
          <% 
          curso.movenext 
          loop
          %>

        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="texto"><b>Texto:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="texto" name="texto" value="<%= texto %>">
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="anexo"><b>Anexo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="anexo" name="anexo" value="<%= anexo %>">
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