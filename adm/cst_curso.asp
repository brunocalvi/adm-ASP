<!--#include file="../connections/conexao.asp"--> 
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<%
  sql = "SELECT * FROM tb_curso a INNER JOIN tb_professor b ON a.cd_professor = b.cd_professor ORDER BY ds_curso "
  set curso = conexao.execute(sql)
%>

<script>
  function Excluir(cod) {
	  if(confirm("Confirma exclusão? ")) {
	    parent.location = "manu_curso.asp?opc=exc&cod=" + cod ;
    }
  } 
</script>

<div class="container">
  <form action="frm_curso.asp" method="POST">
    <div class="row area-titulo">
      <div class="col-md-6">
        <h4>curso</h4>
      </div>
      <div class="col-md-6 btn-t">
        <a href="frm_curso.asp">
          <button type="submit" class="btn btn-primary">Adicionar</button>
        </a>
      </div>
    </div>
    
    <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Curso</th>
            <th>Professor</th>
            <th>Resumo</th>		
            <th>Ativo</th>		
            <th>#</th>
          </tr>
        </thead>
        <tbody>

          <%
          'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
          do while not curso.eof 
          %>
          
          <tr>
            <td>
              <a href="frm_curso.asp?evt=alt&cod=<%= curso("cd_curso") %>">
                <i class="ri-settings-5-fill" title="Editar"></i>
              </a>		
            </td>
            <td><%= curso("ds_curso") %></td>
            <td><%= curso("ds_professor") %></td>
            <td><%= curso("resumo") %></td>
            <td>
              <%
                if cint(curso("ativo")) = 1 then
                  response.write "<font color=blue>ATIVO</font>"
                else
                  response.write "<font color=red>INATIVO</font>"
                end if
              %>
            </td>
            <td>
              <a href="javascript:Excluir(<%= curso("cd_curso") %>)">
                <i class="ri-delete-bin-5-fill" title="Deletar"></i>
              </a>		
            </td>
          </tr>

          <%
          'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
          curso.movenext
          loop
          %>

        </tbody>
      </table>
    </div>
  </form>

</div>

<!--#include file="includes/footer.asp"-->  