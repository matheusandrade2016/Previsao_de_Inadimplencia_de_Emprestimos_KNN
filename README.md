# Previsao_de_Inadimplencia_de_Emprestimos_KNN

Predição de Inadimplência de Empréstimos com KNN (k-nearest neighbors)

**Introdução:**

Este projeto tem como objetivo desenvolver um modelo de classificação para identificar o risco de inadimplência de clientes de crédito, utilizando a técnica de KNN ou vizinho mais proximo. A predição precisa de inadimplência é fundamental para instituições financeiras, pois permite reduzir perdas e otimizar a tomada de decisão.

**Metodologia:**

1. **Coleta de Dados:** Os dados foram pré-processados para lidar com valores ausentes (imputação pela média) e padronizados.

2. **Pré-processamento:** Os dados foram pré-processados para lidar com valores ausentes Média, Valoes Nulos e Padronização ultilziando a função Scale, pois o algotirmo KNN necessita que as variáveis estejam na mesma escala 

3. **Modelagem:**  Um modelo de KNN foi treinado com a biblioteca class com os seguintes parâmetros k = 5 onde obtive o melhor resultado digna de passagem sempre bom utilizar numero impar. A cross-validation de 10 folds foi utilizada para avaliar o desempenho do modelo.

4. **Avaliação:** O modelo foi avaliado utilizando a técnica de cross-validation  de 10 folds. As métricas de acurácia, precisão, recall e F1-score e Curva ROC .

**Confusion Matrix**

![image](https://github.com/user-attachments/assets/9a98d068-c751-4564-a592-62140331eaaa)

**Curva Roc**

![image](https://github.com/user-attachments/assets/0f3d51a1-2a1a-43ca-8b32-1eb60368eb6e)

**Resultados:**

O modelo apresentou uma acurácia de 97% na previsão de inadimplência. As variáveis mais importantes para a classificação foram renda, idade e histórico de crédito. A figura abaixo mostra a matriz de confusão do modelo:

**Limitações:**

**Desbalanceamento de classes:** A taxa de inadimplência geralmente é baixa, o que pode levar a um viés em favor da classe majoritária.

**Generalização:** O modelo pode não generalizar bem para novos conjuntos de dados com características diferentes.

**Tecnologias Utilizadas:**

* Linguagem: R
* Bibliotecas: caTools, class, caret
* Ambiente: RStudio

  # Uso:
  
- Carregar a base de dados com informações dos clientes e seus empréstimos.
- Dividir a base em conjuntos de treino e teste.
- Treinar o modelo KNN "k-nearest neighbors"
- Fazer previsões para novos clientes.
- Avaliar o desempenho do modelo com as métricas e a matriz de confusão.

**Autor:**
Matheus Andrade Moreira
