
<%@ page import = "cadastroee.model.Produto" %>
<%@ page import = "java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Produtos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>
<body>
    <h1>Listagem de Produtos</h1>
    <a class="btn btn-primary m-2" href="ServletProdutoFC?acao=formIncluir">Incluir Novo Produto</a>
    
    <table border="1" class="table table-striped">
        <tr class="table-dark">
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
        out.println("<td><a class='btn btn-primary btn-sm' href='ServletProdutoFC?acao=formAlterar&id="+produto.getIdProduto()+"'>Alterar</a> <a class='btn btn-danger btn-sm' href='ServletProdutoFC?acao=excluir&id="+produto.getIdProduto()+"'>Excluir</a></td>");
            }
        %>
    </table>
</body>
</html>