CREATE OR REPLACE FUNCTION func_dbexplore(st text, ot boolean, tr boolean) RETURNS int AS
$$
declare
s text;
i int := 0;
curimp cursor for SELECT * FROM INFORMATION_SCHEMA.COLUMNS;
recimp record;
BEGIN
    open curimp;
    loop
        fetch curimp into recimp;
        if ot 
        then
            if rec.DATA_TYPE in ('nchar', 'ntext', 'nvarchar')
                s:='select count(*) from '||recimp.TABLE_NAME||' where '||recimp.COLUMN_NAME||' = '||st;
                execute s into i;
                if i > 0 
                then
                    RAISE notice 'Table, Column, Count : % % %', recimp.TABLE_NAME, recimp.COLUMN_NAME, i;
                end if;
            end if;
        else
            s:='select count(*) from '||recimp.TABLE_NAME||' where '||recimp.COLUMN_NAME||' = '||st;
            execute s into i;
            if i > 0 
            then
                RAISE notice 'Table, Column, Count : % % %', recimp.TABLE_NAME, recimp.COLUMN_NAME, i;
            end if;
        end if;
        EXIT WHEN NOT FOUND;
    end loop;
    close curimp;  
return i;
$$ LANGUAGE 'plpgsql';