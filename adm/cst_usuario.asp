<!--#include file="../connections/conexao.asp"-->  
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"-->  

<%
  sql = "SELECT * FROM tb_usuario ORDER BY ds_usuario "
  set usuario = conexao.execute(sql)
%>

<script>
  function Excluir(cod) {
	  if(confirm("Confirma exclusão? ")) {
	    parent.location = "manu_usuario.asp?opc=exc&cod=" + cod ;
    }
  } 
</script>

<div class="container">
  <form action="frm_usuario.asp" method="POST">
    <div class="row area-titulo">
      <div class="col-md-6">
        <h4>usuario</h4>
      </div>
      <div class="col-md-6 btn-t">
        <a href="frm_usuario.asp">
          <button type="submit" class="btn btn-primary">Adicionar</button>
        </a>
      </div>
    </div>
    
    <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Usuario</th>
            <th>#</th>
          </tr>
        </thead>
        <tbody>

          <%
          'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
          do while not usuario.eof 
          %>
          
          <tr>
            <td>
              <a href="frm_usuario.asp?evt=alt&cod=<%= usuario("cd_usuario") %>">
                <i class="ri-settings-5-fill" title="Editar"></i>
              </a>		
            </td>
            <td><%= usuario("ds_usuario") %></td>
            <td>
              <a href="javascript:Excluir(<%= usuario("cd_usuario") %>)">
                <i class="ri-delete-bin-5-fill" title="Deletar"></i>
              </a>		
            </td>
          </tr>

          <%
          'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
          usuario.movenext
          loop
          %>

        </tbody>
      </table>
    </div>
  </form>

</div>

<!--#include file="includes/footer.asp"-->  