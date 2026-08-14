-- ============================================================
-- CURSO : SQL & Banco de Dados para QA
-- SEÇÃO : 07 - SQL Essencial para QA (na prática)
-- AULA  : 28 - WHERE, ORDER BY e LIMIT
-- BANCO : Supabase Northwind (PostgreSQL)
-- ============================================================
-- OBJETIVO:
--   Aprender a extrair dados com SELECT — colunas específicas,
--   alias e exploração das tabelas principais do projeto.
-- ============================================================
-- TABELAS UTILIZADAS:
--   - products, categories, suppliers
-- ============================================================

-- -----------------------------------------------
-- BLOCO 1 — Explorando as tabelas do projeto
-- -----------------------------------------------

-- todas as colunas de products e trazendo apenas 15 linhas para a consulta
SELECT
    id,
    category_id,
    supplier_id,
    "name",
    slug,
    description,
    short_description,
    price,
    cost_price,
    stock_quantity,
    reorder_level,
    image_url,
    sku,
    barcode,
    weight,
    is_active,
    is_featured,
    discount_percentage,
    rating,
    reviews_count,
    views_count,
    sales_count,
    created_at,
    updated_at
FROM
    public.products
LIMIT 15;

-- trazendo algumas colunas e filtrando pela categoria igual 13 e limitando a 25 linhas
SELECT
    id,
    category_id,
    "name",
    price,
    cost_price,
    is_active    
FROM
    public.products
WHERE category_id = 13    
LIMIT 25;

-- trazendo algumas colunas e filtrando pela categoria diferente de 13, ordenando pelo id da categoria ascendente e limitando a 25 linhas
SELECT
    id,
    category_id,
    "name"    
FROM
    public.products
WHERE category_id <> 13 
ORDER BY category_id  ASC 
LIMIT 25;

-- trazendo algumas colunas e filtrando pela categoria diferente de 13, ordenando pelo id da categoria descendente e limitando a 25 linhas
SELECT
    id,
    category_id,
    "name"    
FROM
    public.products
WHERE category_id <> 13 
ORDER BY category_id DESC  
LIMIT 25;


-- trazendo algumas colunas e filtrando pela categoria maior ou igual a 13, ordenando pelo nome ascendente e limitando a 25 linhas

SELECT
    id,
    category_id,
    "name"    
FROM
    public.products
WHERE category_id >= 13 
ORDER BY "name" ASC   
LIMIT 25;

-- trazendo algumas colunas e filtrando pela categoria maior que 13 e preço maior que 1234, ordenando pelo preço ascendente e limitando a 25 linhas
SELECT
    id,
    category_id,
    "name",
    price
FROM
    public.products
WHERE category_id > 13 
AND price > 1234
ORDER BY price 
LIMIT 25;

-- trazendo algumas colunas e filtrando pela categoria maior que 13 e preço maior que 1234, ordenando duas colunas: pelo id da categoria descendente e pelo preço ascendente e limitando a 25 linhas
SELECT
    id,
    category_id,
    "name",
    price
FROM
    public.products
WHERE category_id > 13 
AND price > 1234
ORDER BY category_id  DESC , price ASC 
LIMIT 25;


-- ============================================================
-- RESULTADO ESPERADO:
--   LIMIT         → Controla a quantidade de linhas retornadas
--   WHERE (=, <>)         → Filtra dados exatos ou exclui valores indesejados
--   WHERE            → Filtra dados baseados em limites mínimos/numéricos
--   ORDER BY            → Organiza os resultados(ASC para crescente de A/Z, DESC para decrescente de Z/A)
--   AND            → Refina o filtro, exigindo que múltiplas condições sejam verdadeiras
--   ORDER BY            → Cria uma ordenação em cascata(hierarquia de desempate)
-- ============================================================