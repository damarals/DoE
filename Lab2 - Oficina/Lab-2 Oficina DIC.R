source("load-p.R")

## Bibliotecas
load_p(c("labestData", "ExpDes.pt", "hnp", "tidyverse"))

## Lendo o Conjunto de Dados da biblioteca labestData
zim <- ZimmermannTb3.5

# Atribui novos rótulos para os níveis.
levels(zim$adub) <- c("100/0/0", "50/50/0", "16/84/0", "16/42/42")

## Gráfico de dispersão com regressão loess
zim %>%
  ggplot(aes(adub, prod, color = adub, group = adub))+
  geom_point()+
  geom_line() +
  stat_summary(mapping = aes(group = 1),
               geom = "line",
               fun.y = "mean")+
  ylab(expression("Produção de grãos de arroz" ~ kg ~ ha^{-1}))+
  xlab(expression("Percentual aplicado de 80" ~
                    kg ~ ha^{-1} ~ "(Plantio/40 DAE/60 DAE)"))

## Delineamento Inteiramente Casualizado
model.dic <- dic(zim$adub, zim$prod)         

## Plot dos Residuos (Diagnóstico)
plotres(model.dic)

## Visualização dos Efeitos
plot.design(prod~adub, data = zim)

# Manualmente
modelo = aov(zim$prod ~ zim$adub) # Análise de Variância

summary(modelo) # Tabela ANOVA

hnp(modelo) # half normal plot

TukeyHSD(modelo) # Teste de hipotese de comparação de médias
plot(TukeyHSD(modelo)) # Plot de comparação de médias por Tukey