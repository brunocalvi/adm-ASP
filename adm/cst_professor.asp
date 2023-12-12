<!--#include file="../connections/conexao.asp"-->  
<!--#include file="includes/header.asp"-->  
<!--#include file="valida.asp"--> 

<%
  sql = "SELECT * FROM tb_professor ORDER BY ds_professor "
  set professor = conexao.execute(sql)
%>

<script>
  function Excluir(cod) {
	  if(confirm("Confirma exclusão? ")) {
	    parent.location = "manu_professor.asp?opc=exc&cod=" + cod ;
    }
  } 
</script>

<div class="container">
  <form action="frm_professor.asp" method="POST">
    <div class="row area-titulo">
      <div class="col-md-6">
        <h4>Professor</h4>
      </div>
      <div class="col-md-6 btn-t">
        <a href="frm_professor.asp">
          <button type="submit" class="btn btn-primary">Adicionar</button>
        </a>
      </div>
    </div>
    
    <div class="table-responsive">          
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Nome</th>
            <th>CPF</th>
            <th>Data Nascimento</th>		
            <th>E-mail</th>		
            <th>#</th>
          </tr>
        </thead>
        <tbody>

          <%
          'AQUI COMEÇA O DO WHILE ONDE TRARÁ AS LINHAS DE ACORDO COM O SELECT FEITO
          do while not professor.eof 
          %>
          
          <tr>
            <td>
              <a href="frm_professor.asp?evt=alt&cod=<%= professor("cd_professor") %>">
                <i class="ri-settings-5-fill" title="Editar"></i>
              </a>		
            </td>
            <td><%= professor("ds_professor") %></td>
            <td><%= professor("cpf") %></td>
            <td><%= professor("data_nascimento") %></td>
            <td><%= professor("email") %></td>
            <td>
              <a href="javascript:Excluir(<%= professor("cd_professor") %>)">
                <i class="ri-delete-bin-5-fill" title="Deletar"></i>
              </a>		
            </td>
          </tr>

          <%
          'LOOP DEPOIS DA LINHA PARA QUE SE REPITA ENQUANTO TIVER REGISTROS NO SELECT FEITO
          professor.movenext
          loop
          %>

        </tbody>
      </table>
    </div>
  </form>

</div>

<!--#include file="includes/footer.asp"-->  