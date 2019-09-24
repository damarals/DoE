# Bibliotecas
require(tidyverse)
require(ExpDes.pt)

# Conjunto de Dados
dados <- read.csv2(file.choose())

# Formatando Labels
dados <- dados %>%
  mutate(especie = str_replace_all(especie, "[^[:alnum:]]", ""),
         especie = factor(especie))

# Tabela de Frequências
xtabs(~recipiente + especie, data = dados)


# Gráfico de dispersão dos dados
gg1 <- ggplot(data = dados,
              mapping = aes(x = especie, y = altura, color = recipiente)) +
  geom_point() +
  stat_summary(mapping = aes(group = recipiente),
               geom = "line",
               fun.y = "mean") +
  scale_colour_brewer(palette = "Set2") +
  theme(legend.position = "top")

gg2 <- ggplot(data = dados,
              mapping = aes(x = recipiente, y = altura, color = especie)) +
  geom_point() +
  stat_summary(mapping = aes(group = especie),
               geom = "line",
               fun.y = "mean") +
  scale_colour_brewer(palette = "Set1") +
  theme(legend.position = "top")

gridExtra::grid.arrange(gg1, gg2, nrow = 1)


# Ajuste do modelo Fatorial 2x3
fat2.dic(fator1 = dados$especie, fator2 = dados$recipiente,
         resp = dados$altura, fac.names = c('ESPECIE', 'RECIPIENTE'))
