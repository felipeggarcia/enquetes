Feature: Listar enquete
Como cliente
Quero poder ver todas as enquetes
Para poder saber o resultado e poder dar a minha opinião

Cenário: Com internet
Dado que o cliente tem conexão com a internet
Quando solicitar para ver enquetes
Então o sistema deve abrir as enquetes
E armazenar os dados atualizados no cache

Cenário: Sem internet
Dado que o cliente não tem conexão com a internet
Quando solicitar para ver enquetes
Então o sistema deve abrir as enquetes as enquetes que foram salvas no cache no último acesso