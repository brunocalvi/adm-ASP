<!--#include file="../connections/conexao.asp"--> 
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<%
  sql = "SELECT * FROM tb_modulo a INNER JOIN tb_curso b ON a.cd_curso = b.cd_curso ORDER BY ds_modulo "
  set modulo = conexao.execute(sql)
%>

<script>
  function Excluir(cod) {
	  if(confirm("Confirma exclusão? ")) {
	    parent.location = "manu_modulo.asp?opc=exc&cod=" + cod ;
    }
  } 
</script>

<div class="container">
  <form action="frm_modulo.asp" method="POST">
    <div class="row area-titulo">
      <div class="col-md-6">
        <h4>modulo</h4>
      </div>
      <div class="col-md-6 btn-t">
        <a href="frm_modulo.asp">
          <button type="submit" class="btn btn-primary">Adicionar</button>
        </a>
      </div>
    </div>
    
    <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>modulo</th>
            <th>Curso</th>
            <th>Texto</th>		
            <th>Anexo</th>		
            <th>#</th>
          </tr>
        </thead>
        <tbody>

          <%
          'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
          do while not modulo.eof 
          %>
          
          <tr>
            <td>
              <a href="frm_modulo_up.asp?evt=alt&cod=<%= modulo("cd_modulo") %>">
                <i class="ri-settings-5-fill" title="Editar"></i>
              </a>		
            </td>
            <td><%= modulo("ds_modulo") %></td>
            <td><%= modulo("ds_curso") %></td>
            <td><%= modulo("texto") %></td>
            <td><a href="uploads/<%= modulo("anexo") %>" target="_blank"><%= modulo("anexo") %></a></td>
            <td>
              <a href="javascript:Excluir(<%= modulo("cd_modulo") %>)">
                <i class="ri-delete-bin-5-fill" title="Deletar"></i>
              </a>		
            </td>
          </tr>

          <%
          'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
          modulo.movenext
          loop
          %>

        </tbody>
      </table>
    </div>
  </form>

</div>

<!--#include file="includes/footer.asp"-->  