## Bibliotecas
require(ggplot2) # Gráficos (Grammar of Graphs)
require(readr) # Operações com Arquivos
require(gridExtra) # Combinação de Gráficos em um só
require(hnp) # Diagnóstico Visual de Modelos de Regressão





## Lendo o Dataset
dados = read_delim(file.choose(), delim = ';')

## Visualizando o "Head" do Dataset
head(dados, n = 2)

## Estatísticas Básicas
summary(dados)

## Analise Exploratória (Univariada)
# Histograma das Importações Brasileiras (IM)
ggplot(dados, aes(x = IM))+
  geom_histogram(bins = 10, color = 'black', 
                 fill="skyblue", alpha = 0.5) + 
  xlab('Importações Brasileiras (IM)')+ylab('Contagem')+
  theme_grey()

# Histograma combinado (Taxa de Câmbio (TCI) e Renda Nacional (RN))
plot1 = ggplot(dados, aes(x = TCI))+
  geom_histogram(bins = 10, color = 'black', fill="skyblue", alpha = 0.5)+
  xlab('Taxa de Câmbio (TCI)')+ylab('Contagem')+
  theme_grey()

plot2 = ggplot(dados, aes(x = RN))+
  geom_histogram(bins = 10, color = 'black', fill="skyblue", alpha = 0.5)+
  xlab('Renda Nacional (RN)')+ylab('Contagem')+
  theme_grey()

grid.arrange(plot1, plot2, ncol=2)

## Análise Exploratória (Multivariada)
# Boxplot pareado (Importações Brasileiras e Renda Nacional)
ggplot(dados, aes(x = IM, y = RN))+
  geom_boxplot(fill="skyblue", aes(group = cut_width(IM, 1500)))+
  xlab('Importações Brasileiras (IM)')+ylab('Renda Nacional (RN)')+
  theme_grey()

# Boxplot pareado (Importações Brasileiras e Taxa de Câmbio)
ggplot(dados, aes(x = IM, y = TCI))+
  geom_boxplot(fill="skyblue", aes(group = cut_width(IM, 1500)))+
  xlab('Importações Brasileiras (IM)')+ylab('Taxa de Câmbio (TCI)')+
  theme_grey()

# Boxplot pareado (Renda Nacional e Taxa de Câmbio)
ggplot(dados, aes(x = RN, y = TCI))+
  geom_boxplot(fill="skyblue", aes(group = cut_width(RN, 10)))+
  xlab('Renda Nacional (RN)')+ylab('Taxa de Câmbio (TCI)')+
  theme_grey()

### Spoilers :O

## Modelo de Regressão Linear Simples
# Modelando a Renda a partir do número de Importações
modelo = lm(RN ~ IM, data = dados)

# Visualizando o Resumo do modelo
summary(modelo)

# Predizendo a Renda Nacional Esperada de 14000 Importações Brasileiras
predict(modelo, newdata = data.frame(IM = 14000))

# Visualização do ajuste do modelo, pela suposição de normalidade
hnp(modelo)
