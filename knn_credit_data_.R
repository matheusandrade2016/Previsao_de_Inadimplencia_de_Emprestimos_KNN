# Instalando nossas Bibliotecas

# Divisão de Treinamento e teste
library(caTools)

# Nosso pacote para o KNN
library(class)

# Importando nossa biblioteca para a vizualização da matriz de confusão
library(caret)

# Curva Roc
library(pROC)

# Carregando nossa base de dados 
base = read.csv('credit_data.csv')

# Transformando minha variavel Y "Alvo" em factor para a validação Cruzada
base$default <- as.factor(base$default)

# # Apagando minha coluna ClientID, pois ela nao ira fazer diferença na hora de ultilizarmos nossos algoritimos
base$clientid = NULL


# # Atualizando meus valores com a media das idades

base$age = ifelse(base$age < 0, 40.92, base$age)

# na.rm = TRUE-- >NAO TRAZ OS VALORES FALTANTES
base$age = ifelse(is.na(base$age), mean(base$age, na.rm = TRUE), base$age)


# Padronizando nossos dados para deixar na mesma escala
base[, 1:3] = scale(base[, 1:3])

# Chamando o comando set.seed, nossa semente para termos o mesmo resultado

set.seed(1)

# 1500 --> para treinar ou seja 75% dos dados
# 500 --> teste  25 % dos dados

divisao = sample.split(base$default, SplitRatio = 0.75)

# Vizualizando nossa divisão
head(divisao)

# Criando minha base de treinamento

# subset --> irar criar um subconjunto
# base, divisao == TRUE --> onde for os valores TRUE ira jogar na base de dados

base_treinamento = subset(base, divisao == TRUE)

# Criando minha base de dados de teste
base_teste = subset(base, divisao == FALSE)  


# Criando minha variavel previsoes

# train --> matriz de dados para fazer o treinamento
# test --> matriz de dados para fazer o teste
# cl ---> qual e a classe
# k --> numeros de vizinhos que iremos ultilizar

previsoes = knn(train = base_treinamento[, -4], test = base_teste[, -4],
                cl = base_treinamento[, 4], k = 5)


# Criando minha matriz de confusão 
matriz_confusao = table(base_teste[, 4], previsoes)
print(matriz_confusao)

# SEMPRE E BOM FAZER A PADRONIZAÇÃO PARA O KNN

# cOM A PADRONIZAÇÃO --> 0.974 
# sEM A PADRONIZAÇÃO --> 0.834 

# Verificando minha acuracia do modelo
confusionMatrix(matriz_confusao)



# Criando nossa variavel de controle, 10 vezes nosso modelo ira fazer
# nossa validação
controle <- trainControl(method = "cv", number = 10)

# Criando nossso Hiperparametros

grid <- expand.grid(k = 1:20)


# Treinando nosos Modelo com o cross-validation e nosso tunnin

modelo_cross <- train(default ~ ., data = base_treinamento,
                      method = "knn", trControl = controle, tuneGrid = grid)


# vizualizando meu modelo
print(modelo_cross)

# Vizualizando meu Modelo
plot(modelo_cross)


# Criando minhas previsoes para o meu modelo
previsoes_modelo_cross <- predict(modelo_cross, newdata = base_teste)

# Criando minha matriz de confusão

matriz_confusao <-  table(base_teste[, 4], previsoes_modelo_cross)

# Vizualzando minha matriz de confusão
matriz_confusao

# Ultilizando minha biblioteca para vizualizar as metricas
confusionMatrix(matriz_confusao, mode = "everything")

# Importância das variáveis
varImp(modelo_cross)


# Criando nosso Objeto para nossa curva ROC " para avaliar o desempenho do modelo 
# em diferentes pontos de corte."

roc_obj <- roc(base_teste$default, predict(modelo_cross, newdata = base_teste, type = "prob")[,2])

# Vizualizando minha Curva ROC
plot(roc_obj, print.auc = T, col = "orange")



