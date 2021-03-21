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


# 2. Usando a base netflix (deixe todas as questões em apenas uma "cadeia de pipes")
  # a) Crie a coluna `antigo`, que indica o quão antigo o filme (ou série) é, e
  #    selecione apenas as variáveis show_id, type, title, antigo, release_year
    #OBS:
    # ano de lançamento < 1950: Muito antigo
    # ano de lançamento entre 1950 e 2000: Antigo
    # ano de lançamento > 2000: Atual

  # b) Ordene o ano de lançamento de menor para maior
  # c) Transforme as variáveis type e rating em variáveis categóricas
  #   (tente usar a função across())

# 3. Quantos Filmes e shows de TV existem nessa base?


# Exercícios TIDYR ----------------------------------------------------------

# 1. Usando a base netflix resolva as seguintes questões(deixe todas as questões
# em apenas uma "cadeia de pipes")

#    a) Separe a coluna duration em duas colunas: unidade e duracao
#    b) transforme a coluna duração em numérica
#    c) Crie uma coluna duração_min com a duração em minutos de cada filme
#    (ou serie). Supona que cada temporada tenha 240 minutos

# Selecione

# 2. Para cada combinação de type (serie e filme) e rating, crie uma lista com
# todas as observações e salve em uma tabela com column-lists

# Para o exercício 3 use a tabela "Largest French Speaking Cities
french_speaking_cities <- read_csv("Largest French Speaking Cities.csv")

glimpse(french_speaking_cities)

# 3. Transforme os dados para quetenhamos apenas 5 colunas: Country Name, region,
# Image URL, ano e populacao


