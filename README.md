# JsonToSQL
Exemplo de Uso do DWRestDataWare para ser Usando com Verbos HTTP. Uma função para converter Json para SQL de INSERT ou UPDATE.

Na Pasta SQL tem o sql para criacao da Tabela

Na Pasta Model/Util tem a Funcao que converte Json para  SQL

Na pasta Client um Projeto para Testar a função JsonToSql.

O Server trata as requiscoes http pelo verbo (GET, POST, PUT, DELETE)

# Use o RestDebugger da IDE do Delphi, ou Postman... etc... para testar o Server RDW

O Server recebe o Json decoda e depois converte em uma string SQL de Insert o Update baseado nos dados do Json para ser tratada pelo

Observar as linhas do event conforme o fontes. DWServerEvents1EventsempresaReplyEventByType
linhas 44 a 55. Nesta linha são tratados os VERBOS HTTP enviados. 


o Json enviado deve ser Encodado para o correto funcionamento do Servidor
-------------------------------------------------
# Exemplo de Uso usando Url encodada
---------------------------------------

Json de Update para Tabela Empresa


[{"EMPNOME": "Minha Primeira Empresa por Json", "EMPCNPJ": "560322323232323", "EMPCEP": "null", "EMPENDERECO": "null", "EMPNUMERO": "null", "EMPCIDADE": "null", "EMPBAIRRO": "null", "EMPUF": "RR", "EMPFONES": "null", "EMPCONTATO": "null", "EMPEMAIL": "null", "EMPINSCRICAOESTADUAL": "null", "EMPSITE": "null" }]


Json encodado em base64


localhost:8082/api/v1/empresa?empid=1&empjson=%5B%7B%22EMPNOME%22%3A+%22Minha+Primeira+Empresa+por+Json%22%2C+%22EMPCNPJ%22%3A+%22560322323232323%22%2C+%22EMPCEP%22%3A+%22null%22%2C+%22EMPENDERECO%22%3A+%22null%22%2C+%22EMPNUMERO%22%3A+%22null%22%2C+%22EMPCIDADE%22%3A+%22null%22%2C+%22EMPBAIRRO%22%3A+%22null%22%2C+%22EMPUF%22%3A+%22RR%22%2C+%22EMPFONES%22%3A+%22null%22%2C+%22EMPCONTATO%22%3A+%22null%22%2C+%22EMPEMAIL%22%3A+%22null%22%2C+%22EMPINSCRICAOESTADUAL%22%3A+%22null%22%2C+%22EMPSITE%22%3A+%22null%22+%7D%5D%0D%0A

ese comando trasforma o Json Recebido conforme a exemplo abaixo:
==>INSERT

INSERT INTO EMPRESA( EMPNOME, EMPCNPJ, EMPCEP, EMPENDERECO, EMPNUMERO, EMPCIDADE, EMPBAIRRO, EMPUF, EMPFONES, EMPCONTATO, EMPEMAIL, EMPINSCRICAOESTADUAL, EMPSITE, EMPDATACADASTRO, EMPDATAALTERA  )  VALUES ('Empresa de Teste 2', '560322323232323', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', 'null', Cast('18.04.2019' as TimeStamp ), Cast('18.04.2019' as TimeStamp ) )

ou 

==> UPDATE

UPDATE EMPRESA SET EMPNOME = 'Empresa de Teste 2', EMPCNPJ = '560322323232323', EMPCEP = 'null', EMPENDERECO = 'null', EMPNUMERO = 'null', EMPCIDADE = 'null', EMPBAIRRO = 'null', EMPUF = 'null', EMPFONES = 'null', EMPCONTATO = 'null', EMPEMAIL = 'null', EMPINSCRICAOESTADUAL = 'null', EMPSITE = 'null', EMPDATACADASTRO =  Cast('18.04.2019' as TimeStamp ), EMPDATAALTERA =  Cast('18.04.2019' as TimeStamp )  WHERE EMPID = 1

para ser usado para atualizar ou inserir dados no Banco Conforme o Exemplo



