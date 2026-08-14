-- ============================================================
-- CURSO : SQL & Banco de Dados para QA
-- SEÇÃO : 07 - SQL Essencial para QA (na prática)
-- AULA  : 29 - LIKE, IN e BETWEEN
-- BANCO : Supabase Northwind (PostgreSQL)
-- ============================================================
-- OBJETIVO:
--   Aprender a realizar buscas avançadas usando padrões de texto (LIKE),
--   listas de valores (IN / NOT IN) e intervalos numéricos (BETWEEN).
-- ============================================================
-- TABELAS UTILIZADAS:
--   - categories, products
-- ============================================================

-- -----------------------------------------------
-- BLOCO 1 — Explorando as tabelas e usando LIKE
-- -----------------------------------------------

-- explorando as colunas da tabela categories limitando a 15 linhas
SELECT
    id,
    "name",
    slug,
    description,
    image_url,
    icon,
    display_order,
    is_active,
    created_at
FROM
    categories
LIMIT 15;

-- filtrando categorias onde a descrição COMEÇA com a palavra "Produtos"
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE description LIKE 'Produtos%'    
LIMIT 15;

-- filtrando categorias onde a descrição CONTÉM a palavra "variados" em qualquer parte
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE description LIKE '%variados%'    
LIMIT 15;

-- filtrando categorias onde a descrição TERMINA com a palavra "variados"
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE description LIKE '%variados'    
LIMIT 15;


-- -----------------------------------------------
-- BLOCO 2 — Usando IN e NOT IN (Listas de valores)
-- -----------------------------------------------

-- filtrando categorias onde o ID está dentro da lista especificada (9, 19, 61, 84)
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE id IN ( 9,19,61,84)    
LIMIT 105;

-- mesma consulta acima, mas com o filtro comentado para trazer todos os registros
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
--WHERE id IN ( 9,19,61,84)    
LIMIT 105;

-- filtrando categorias onde o nome é exatamente "Roupas", vazio ("") ou "Pets"
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE  "name" IN ( 'Roupas', '', 'Pets')    
LIMIT 105;

-- filtrando categorias onde o nome NÃO ESTÁ na lista ("Roupas", vazio, "Pets")
SELECT
    id,
    "name",
    slug,
    description,
    created_at
FROM
    categories
WHERE  "name" NOT IN ( 'Roupas', '', 'Pets')    
LIMIT 105;


-- -----------------------------------------------
-- BLOCO 3 — Explorando produtos e usando BETWEEN
-- -----------------------------------------------

-- explorando as colunas da tabela products limitando a 10 linhas
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
    products
LIMIT 10;

-- filtrando produtos com preço no intervalo ENTRE 1000 e 1300
SELECT
    id,   
    "name",
    slug,
    description,    
    price,
    stock_quantity,
   	sku,    
    updated_at
FROM
    products
WHERE price BETWEEN 1000 AND 1300    
LIMIT 10;

-- filtrando produtos com ID no intervalo ENTRE 500 e 550
SELECT
    id,   
    "name",
    slug,
    description,    
    price,
    stock_quantity,
   	sku,    
    updated_at
FROM
    products
WHERE id BETWEEN 500 AND 550    
LIMIT 10;

-- filtrando produtos onde o estoque está negativo (intervalo ENTRE -10 e 0)
SELECT
    id,   
    "name",
    slug,
    description,    
    price,
    stock_quantity,
   	sku,    
    updated_at
FROM
    products
WHERE stock_quantity  BETWEEN -10 AND 0    
LIMIT 10;


-- ============================================================
-- RESULTADO ESPERADO:
--   LIKE          → Filtra dados por um padrão de texto (% = qualquer quantidade de caracteres)
--   IN            → Filtra dados que coincidam com qualquer valor dentro de uma lista
--   NOT IN        → Filtra dados que não coincidam com nenhum valor de uma lista
--   BETWEEN       → Filtra dados que estejam dentro de um intervalo numérico
-- ============================================================