# Local Load Current Account Use Case

> ## Caso de sucesso
1. Sistema solicita os dados das enquetes do cache
2. Sistema valida os dados recebidos do cache
3. Sistema entrega os dados das enquetes

> ## Exceção - Cache vazio
1. Sistema retorna uma mensagem de erro inesperado


> ## Exceção - Dados inválidos no cache
1. Sistema retorna uma mensagem de erro inesperado
2. Sistema limpa os dados do cache