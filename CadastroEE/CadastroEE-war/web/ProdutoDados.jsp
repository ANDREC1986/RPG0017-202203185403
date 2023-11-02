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
        <title>JSP Page</title>
    </head>
<body>
        <h1>Dados do Produto</h1>
    <%
            Produto produto = Produto.class.cast(request.getAttribute("produto"));
    %>
    <form action="ServletProdutoFC" method="POST">
        <label for="nome">Nome:</label>
        <input type="text" name="nome" id="nome" required value="<% 
            if (produto.getNome() != null) {
            out.print(produto.getNome());
            }
        %>"><br><br>
        <label for="quantidade">Quantidade:</label>
        <input type="number" name="quantidade" id="quantidade" required value = <%
            if(produto.getQuantidade() != 0) {
                out.print(produto.getQuantidade());
            }
               %>><br><br>
        <label for="preco">Preço de Venda:</label>
        <input type="text" name="preco" id="preco" required value="<%
            if(produto.getPrecoDeVenda() != null) {
                out.print(produto.getPrecoDeVenda());
            }
        %>"><br><br>
        <input type="hidden" name="id" id="id" value="<% out.print(produto.getIdProduto());%>">
        <input type="hidden" name="acao" id="acao" value=<%out.print(request.getAttribute("acao"));%>>
        <input type="submit" value="<%
            String acao = request.getAttribute("acao").toString();
            acao = acao.substring(0, 1).toUpperCase() + acao.substring(1);
            out.print(acao);
        %> Produto">
    </form>
</body>
</html>
