# JsonToSQL
# Retorno em  Json puro 
Exemplo de Uso do DWRestDataWare para ser Usando com Verbos HTTP. Retorna um Json formatadao,   alem de Uma Funcao Uma função para converter Json para SQL de INSERT ou UPDATE.

Na Pasta SQL tem o sql para criacao da Tabela

Na Pasta Model/Util tem a Funcao que converte Json para  SQL

Na pasta Client um Projeto para Testar a função JsonToSql.

O Server trata as requiscoes http pelo verbo (GET, POST, PUT, DELETE)

# Use o RestDebugger da IDE do Delphi, ou Postman ou outro para testar o Server RDW
- Voce pode Usar o Browse mas sera executado somente o Metodo GET por default do Browser

O Server recebe o Json decoda e depois converte em uma string SQL de Insert o Update baseado nos dados do Json para ser tratada pelo

- o RW Server USA ReplyEventByType para identificar os Verbos de Chamada

Observar as linhas do event conforme o fontes. DWServerEvents1EventsempresaReplyEventByType
linhas 44 a 55. Nesta linha são tratados os VERBOS HTTP enviados. 


o Json enviado deve ser Encodado para o correto funcionamento do Servidor

Este JSON Abaixoo Foi UTILIZADO NOS EXEMPLOS APOS CODIFICAR EM BASE64



[{"EMPNOME": "Minha Primeira Empresa por Json", "EMPCNPJ": "560322323232323", "EMPCEP": "null", "EMPENDERECO": "null", "EMPNUMERO": "null", "EMPCIDADE": "null", "EMPBAIRRO": "null", "EMPUF": "RR", "EMPFONES": "null", "EMPCONTATO": "null", "EMPEMAIL": "null", "EMPINSCRICAOESTADUAL": "null", "EMPSITE": "null" }]

-------------------------------------------------
# Exemplo de Uso usando Url encodada
---------------------------------------


# Metodo : GET 

localhost:8082/api/v1/empresa

. Retorna Lista de Empresas

localhost:8082/api/v1/empresa?empid=1

. Reorna empresa com id = 1

# Retorno: 
[{"EMPNOME": "Minha Primeira Empresa por Json", "EMPCNPJ": "560322323232323", "EMPCEP": "null", "EMPENDERECO": "null", "EMPNUMERO": "null", "EMPCIDADE": "null", "EMPBAIRRO": "null", "EMPUF": "RR", "EMPFONES": "null", "EMPCONTATO": "null", "EMPEMAIL": "null", "EMPINSCRICAOESTADUAL": "null", "EMPSITE": "null" }]


Usando Metodo : POST
------
Json de Insere dados para Tabela Empresa
Json encodado em base64

localhost:8082/api/v1/empresa?empjson=%5B%7B%22EMPNOME%22%3A+%22Minha+Primeira+Empresa+por+Json%22%2C+%22EMPCNPJ%22%3A+%22560322323232323%22%2C+%22EMPCEP%22%3A+%22null%22%2C+%22EMPENDERECO%22%3A+%22null%22%2C+%22EMPNUMERO%22%3A+%22null%22%2C+%22EMPCIDADE%22%3A+%22null%22%2C+%22EMPBAIRRO%22%3A+%22null%22%2C+%22EMPUF%22%3A+%22RR%22%2C+%22EMPFONES%22%3A+%22null%22%2C+%22EMPCONTATO%22%3A+%22null%22%2C+%22EMPEMAIL%22%3A+%22null%22%2C+%22EMPINSCRICAOESTADUAL%22%3A+%22null%22%2C+%22EMPSITE%22%3A+%22null%22+%7D%5D%0D%0A

. Insere Dados NO BD


# Metodo : PUT

localhost:8082/api/v1/empresa?empid=1'&empjson=%5B%7B%22EMPNOME%22%3A+%22Minha+Primeira+Empresa+por+Json%22%2C+%22EMPCNPJ%22%3A+%22560322323232323%22%2C+%22EMPCEP%22%3A+%22null%22%2C+%22EMPENDERECO%22%3A+%22null%22%2C+%22EMPNUMERO%22%3A+%22null%22%2C+%22EMPCIDADE%22%3A+%22null%22%2C+%22EMPBAIRRO%22%3A+%22null%22%2C+%22EMPUF%22%3A+%22RR%22%2C+%22EMPFONES%22%3A+%22null%22%2C+%22EMPCONTATO%22%3A+%22null%22%2C+%22EMPEMAIL%22%3A+%22null%22%2C+%22EMPINSCRICAOESTADUAL%22%3A+%22null%22%2C+%22EMPSITE%22%3A+%22null%22+%7D%5D%0D%0A

para ser usado para atualizar dados no Banco Conforme o Exemplo


# Metodo :DELETE

localhost:8082/api/v1/empresa?empid=1'

Deleta empresa com ID =1
