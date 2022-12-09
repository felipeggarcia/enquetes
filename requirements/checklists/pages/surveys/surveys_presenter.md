# Surveys Presenter

> ## Regras
1. Chamar o LoadSurveys no método loadData 
2. Notificar o isLoadingStream como true antes de chamar o LoadSurveys
3. Notificar o isLoadingStream como false no fim do LoadSurveys
4. Notificar o loadSurveysStream como erro caso LoadSurveys retorne erro
5. Notificar o loadSurveysStream como uma lista de Surveys caso o LoadSurveys retorne sucesso
6. Levar o usuário para a tela de Resultado da Enquete ao clicar em alguma enquete
