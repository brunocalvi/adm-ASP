<!--#include file="../connections/conexao.asp"--> 
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<%
'RECEBENDO C�DIGO COMO PARAMETRO E EVT PARA SABER SE VAI INCLUIR OU ALTERAR
cod  = Request.QueryString("cod")
evt  = Request.QueryString("evt")

if cod <> "" then
   cod = cint(cod)
end if

if ucase(evt) = "ALT" then
   sql = "SELECT * FROM tb_usuario WHERE cd_usuario = "& cod
'  Response.Write(sql)
'  Response.End()
   set rs = conexao.execute(sql)
   senha      = rs("senha") 
   usuario    = rs("ds_usuario")    
   bot        = "Alterar"
else
   ativo = 0
   bot       = "Incluir"
end if

%>

<div class="container">
<br><br>
  <form class="form-horizontal" action="manu_usuario.asp" method="post">
      <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Usuario:</b></label>
      <div class="col-sm-4">
        <input type="text" class="form-control"  placeholder="usuario" name="usuario" value="<%=usuario%>">
      </div>
    </div>    



    <div class="form-group">
      <label class="control-label col-sm-2" for="nome"><b>Senha:</b></label>
      <div class="col-sm-4">
        <input type="password" class="form-control" name="senha" value="<%=senha%>">
      </div>
    </div>    

    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="btn btn-default" name="Botao" value="<%=bot%>"><%=bot%></button>
      </div>
    </div>
	<input type="hidden" name="hfcod" value="<%=cod%>">	
  </form>
</div>

<!--#include file="includes/footer.asp"-->  