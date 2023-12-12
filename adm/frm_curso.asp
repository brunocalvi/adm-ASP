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
  sql = "SELECT * FROM tb_curso WHERE cd_curso = "& cod
  'Response.Write(sql)
  'Response.End()

  set curso = conexao.execute(sql)
    ativo       = curso("ativo") 
    nome_curso  = curso("ds_curso") 
    resumo      = curso("resumo") 
    professor   = curso("cd_professor") 
    
    bot = "Alterar"
else
    ativo = 0
    bot = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_curso.asp" method="post">

    <div class="form-group">
      <label class="control-label col-sm-2" for="nome_curso"><b>Curso:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="nome_curso" name="nome_curso" value="<%= nome_curso %>">
      </div>
    </div>

    <% 
    sql = "SELECT * FROM tb_professor ORDER BY ds_professor"
    set professor = conexao.execute(sql)
    %>

    <div class="form-group">
      <label class="control-label col-sm-2" for="professor"><b>Professor:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="professor" id="professor">

          <% do while not professor.eof %>
          <option value="<%= professor("cd_professor") %>"><%= professor("ds_professor") %></option>
          <% 
          professor.movenext 
          loop
          %>

        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="ativo"><b>Ativo:</b></label>
      <div class="col-sm-4">
        <select class="form-control" name="ativo" id="ativo">

          <% if cint(ativo) = 1 then %>  
            <option value="1">Ativo</option>
            <option value="0">Inativo</option>
          <% else %>   
            <option value="0">Inativo</option>
            <option value="1">Ativo</option>
          <% end if %>

        </select>
      </div>
    </div>

    <div class="form-group">
      <label class="control-label col-sm-2" for="resumo"><b>Resumo:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control" id="resumo" name="resumo" value="<%= resumo %>">
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