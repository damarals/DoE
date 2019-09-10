source("load-p.R")

## Bibliotecas
load_p(c("labestData", "ExpDes.pt", "hnp"))

## Lendo o Conjunto de Dados da biblioteca labestData
da <- BanzattoQd4.5.2

# Passa testemunha para primeiro nível para ordem mais lógica.
da <- da %>%
  mutate(promalin = fct_relevel(promalin, "Testemunha", after = 0))

## Tabela de frequência.
xtabs(~promalin + bloco, data = da)

# Corrige valor registrado errado no pacote.
da$peso[2] <- 139.3 

# Gráfico de dispersão com regressão loess
da %>% 
  ggplot(aes(x = promalin, y = peso, color = bloco, group = bloco)) +
  geom_point() +
  geom_line() +
  stat_summary(mapping = aes(group = 1),
               geom = "line",
               fun.y = "mean")

## Delineamento em Blocos Casualizados
model.bic <- dbc(trat = da$promalin, bloco = da$bloco,
                 resp = da$peso, mcomp = "duncan")

## Plot dos Residuos (Diagnóstico)
plotres(model.dic)

## Visualização dos Efeitos
plot.design(peso ~ promalin + bloco, data = da)

## Visualização das interações
interaction.plot(da$promalin, da$bloco, da$peso)

# Manualmente
modelo = aov(peso ~ bloco + promalin, data = da) # Análise de Variância

summary(modelo) # Tabela ANOVA

hnp(modelo) # half normal plot

TukeyHSD(modelo) # Teste de hipotese de comparação de médias
plot(TukeyHSD(modelo)) # Plot de comparação de médias por Tukey
