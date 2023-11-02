<%-- 
    Document   : ProdutoDados
    Created on : 1 de nov. de 2023, 19:03:39
    Author     : andre
--%>

<%@ page import = "cadastroee.model.Produto" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <title>JSP Page</title>
    </head>
<body class="container">
        <h1>Dados do Produto</h1>
    <%
            Produto produto = Produto.class.cast(request.getAttribute("produto"));
    %>
    <form class="form" action="ServletProdutoFC" method="POST">
        <div class="mb-3">
            <label for="nome" class="form-label">Nome:</label>
            <input class="form-control" type="text" name="nome" id="nome" required value="<% 
                if (produto.getNome() != null) {
                out.print(produto.getNome());
                }
            %>">
        </div>
        <div class="mb-3">
        <label for="quantidade" class="form-label">Quantidade:</label>
        <input class="form-control" type="number" name="quantidade" id="quantidade" required value = "<%
            if(produto.getQuantidade() != 0) {
                out.print(produto.getQuantidade());
            }
               %>">
        </div>
        <div class="mb-3">
        <label for="preco" class="form-label">Preço de Venda:</label>
        <input class="form-control" type="text" name="preco" id="preco" required value="<%
            if(produto.getPrecoDeVenda() != null) {
                out.print(produto.getPrecoDeVenda());
            }
        %>">
        </div>
        <input type="hidden" name="id" id="id" value="<% out.print(produto.getIdProduto());%>">
        <input type="hidden" name="acao" id="acao" value=<%out.print(request.getAttribute("acao"));%>>
        <input class="btn btn-primary" type="submit" value="<%
            String acao = request.getAttribute("acao").toString();
            acao = acao.substring(0, 1).toUpperCase() + acao.substring(1);
            out.print(acao);
        %> Produto">
    </form>
</body>
</html>
