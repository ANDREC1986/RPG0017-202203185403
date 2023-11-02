
<%@ page import = "cadastroee.model.Produto" %>
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
</head>
<body>
    <h1>Listagem de Produtos</h1>
    <a href="ServletProdutoFC?acao=formIncluir">Incluir Novo Produto</a>
    
    <table border="1">
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Quantidade</th>
            <th>Preço</th>
            <th>Ações</th>
        </tr>
        <% 
        List<Produto> produtos = (List<Produto>) request.getAttribute("produtos");
        for (Produto produto : produtos) {
        out.println("<tr><td>"+produto.getIdProduto()+"</td>");
        out.println("<td>"+produto.getNome()+"</td>");
        out.println("<td>"+produto.getQuantidade()+"</td>");
        out.println("<td>"+produto.getPrecoDeVenda()+"</td>");
        out.println("<td><a href='ServletProdutoFC?acao=formAlterar&id="+produto.getIdProduto()+"'>Alterar</a> <a href='ServletProdutoFC?acao=excluir&id="+produto.getIdProduto()+"'>Excluir</a></td>");
            }
        %>
    </table>
</body>
</html>