## Bibliotecas
require(datasets)
require(ggplot2)
## Dataset
data("iris")
## Alterando os nomes das variáveis
colnames(iris) = c('Sepala.Comprimento', 'Sepala.Largura', 'Petala.Comprimento', 'Petala.Largura',
                   'Especies')
## Estatísticas Básicas
summary(iris$Sepala.Largura)
## Gráficos
# Histograma Univariado (1 Variável)
ggplot(iris, aes(x = Petala.Largura))+
  geom_histogram(bins = 10, color = 'black', fill="skyblue", alpha = 0.5)+
  theme_grey()
# Boxplot Univariado (1 Variável)
ggplot(iris, aes(y = Petala.Comprimento, x = Especies))+
  geom_boxplot(aes(col = Especies), fill="skyblue")+
  theme_grey()
# Dispersão Bivariado (2 Variáveis)
ggplot(iris, aes(x = Petala.Largura, y = Petala.Comprimento))+
  geom_point(aes(col = Especies))+
  theme_grey()
