## Bibliotecas
require(ggplot2) # Gráficos (Grammar of Graphs)
require(readr) # Operações com Arquivos
require(gridExtra) # Combinação de Gráficos em um só
require(hnp) # Diagnóstico Visual de Modelos de Regressão

## Lendo o Dataset


## Visualizando o "Head" do Dataset


## Estatísticas Básicas


## Analise Exploratória (Univariada)
# Histograma das Importações Brasileiras (IM)

# Histograma combinado (Taxa de Câmbio (TCI) e Renda Nacional (RN))


## Análise Exploratória (Multivariada)
# Boxplot pareado (Importações Brasileiras e Renda Nacional)

# Boxplot pareado (Importações Brasileiras e Taxa de Câmbio)

# Boxplot pareado (Renda Nacional e Taxa de Câmbio)


### Spoilers :O

## Modelo de Regressão Linear Simples
# Modelando a Renda a partir do número de Importações

# Visualizando o Resumo do modelo

# Predizendo a Renda Nacional Esperada de 14000 Importações Brasileiras

# Visualização do ajuste do modelo, pela suposição de normalidade
