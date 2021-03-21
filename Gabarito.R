#-----------------------------------------------------------------------------
library(dplyr)
library(tidyr)
library(readr)

# Base de dados --------------------------------------------------------------
netflix_titles <- read_csv("netflix_titles.csv") %>% tibble::as_tibble()
load("ratings.rda")

glimpse(netflix_titles)
glimpse(ratings)

# Exercicio DPLYR ------------------------------------------------------------
# 1. a) Retire todas as observações sem informação de pais
#    b) Junte estes dados à base de dados ratings
#    c) salve a base como "netflix"

netflix <- netflix_titles %>%
  filter(!is.na(country)) %>%
  left_join(ratings)

# 2. Usando a base netflix (deixe todas as questões em apenas uma "cadeia de pipes")
# a) Crie a coluna `antigo`, que indica o quão antigo o filme (ou série) é, e
#    selecione apenas as variáveis show_id, type, title, antigo, release_year
#OBS:
# ano de lançamento < 1950: Muito antigo
# ano de lançamento entre 1950 e 2000: Antigo
# ano de lançamento > 2000: Atual

# b) Ordene o ano de lançamento de menor para maior
# c) Transforme as variáveis type e rating em fatores
#   (tente usar a função across())

netflix %>%
  mutate(
    antigo = case_when(
      release_year < 1950 ~ "Muito antigo",
      release_year <2000 ~ "Antigo",
      release_year >= 2000 ~ "Atual"
    )
  ) %>%
  arrange(
    release_year
  ) %>%
  mutate(
    across(
      c(type, rating),
      as.factor
    )
  )

# 3. Quantos Filmes e shows de TV existem nessa base?

netflix %>%
  group_by(type) %>%
  summarise(
    n = n()
  )

# Exercícios TIDYR ----------------------------------------------------------

# 1. Usando a base netflix resolva as seguintes questões(deixe todas as questões
# em apenas uma "cadeia de pipes")

#    a) Separe a coluna duration em duas colunas: unidade e duracao
#    b) transforme a coluna duração em numérica
#    c) Crie uma coluna duração_min com a duração em minutos de cada filme
#    (ou serie). Supona que cada temporada tenha 240 minutos

netflix %>%
  separate(duration, into = c("duracao", "unidade"), sep = " ") %>%
  mutate(duracao = as.numeric(duracao), duracao = ifelse(unidade %in% c("Season", "Seasons"), duracao*240, duracao) )
# Selecione

# 2. Para cada combinação de type (serie e filme) e rating, crie uma lista com
# todas as observações e salve em uma tabela com column-lists
netflix %>%
  group_by(type, rating) %>%
  nest()

# Para o exercício 3 use a tabela "Largest French Speaking Cities
french_speaking_cities <- read_csv("Largest French Speaking Cities.csv")

glimpse(french_speaking_cities)

# 3. Transforme os dados para quetenhamos apenas 5 colunas: Country Name, region,
# Image URL, ano e populacao
french_speaking_cities %>%
  pivot_longer(
    `1950`:`2019`,
    names_to = "ano",
    values_to = "populacao"
  )

