# JsonToSQL
Exemplo de Uso do DWRestDataWare para ser Usando com Verbos HTTP. Uma função para converter Json para SQL de Inster ou Update.

Na Pasta SQL tem o sql para criacao da Tabela

Na Pasta Model/Util tem a Funcao que converte Json para  SQL

Na pasta Client um Projeto para Testar o servidor.

O Server trata as requiscoes http pelo verbo (GET, POST, PUT, DELETE)

o Json enviado deve ser Encodado para o correto funcionamento do Servidor
-------------------------------------------------
# Exemplo de Uso usando Url encodada
---------------------------------------

Json de Update para Tabela Empresa


[{"EMPNOME": "Minha Primeira Empresa por Json", "EMPCNPJ": "560322323232323", "EMPCEP": "null", "EMPENDERECO": "null", "EMPNUMERO": "null", "EMPCIDADE": "null", "EMPBAIRRO": "null", "EMPUF": "RR", "EMPFONES": "null", "EMPCONTATO": "null", "EMPEMAIL": "null", "EMPINSCRICAOESTADUAL": "null", "EMPSITE": "null" }]


localhost:8082/api/v1/empresa?empid=1&empjson=%5B%7B%22EMPNOME%22%3A+%22Minha+Primeira+Empresa+por+Json%22%2C+%22EMPCNPJ%22%3A+%22560322323232323%22%2C+%22EMPCEP%22%3A+%22null%22%2C+%22EMPENDERECO%22%3A+%22null%22%2C+%22EMPNUMERO%22%3A+%22null%22%2C+%22EMPCIDADE%22%3A+%22null%22%2C+%22EMPBAIRRO%22%3A+%22null%22%2C+%22EMPUF%22%3A+%22RR%22%2C+%22EMPFONES%22%3A+%22null%22%2C+%22EMPCONTATO%22%3A+%22null%22%2C+%22EMPEMAIL%22%3A+%22null%22%2C+%22EMPINSCRICAOESTADUAL%22%3A+%22null%22%2C+%22EMPSITE%22%3A+%22null%22+%7D%5D%0D%0A



