
-- DO $$
-- BEGIN
--    IF current_schema() = 'public' THEN
--        RAISE EXCEPTION 'Esta extensão não pode ser instalada no schema public. Use: CREATE EXTENSION minha_extensao SCHEMA outro_schema;';
--    END IF;
-- END $$;

CREATE IF NOT EXISTS SCHEMA schema_teste;

CREATE TABLE schema_teste.saudacoes (
    id serial PRIMARY KEY,
    frase text NOT NULL
);

INSERT INTO schema_teste.saudacoes (frase) VALUES ('Olá Mundo');

CREATE FUNCTION schema_teste.get_hello(seu_nome text)
RETURNS text AS $$
DECLARE
    msg text;
BEGIN
    SELECT frase INTO msg FROM saudacoes LIMIT 1;
    RETURN msg || ', ' || seu_nome || '!';
END;
$$ LANGUAGE plpgsql
SET search_path = schema_teste;

