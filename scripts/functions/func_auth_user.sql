CREATE OR REPLACE FUNCTION func_auth_user(usrname text, fncname text) RETURNS boolean AS
$$
DECLARE
usrid int;
fncid int;
fa_count int;
BEGIN
    if ( usrname is null )
    then
        raise warning 'User name must not be null';
        return false;
    end if;
    if ( fncname is null )
    then
        raise warning 'Function name must not be null';
        return false;
    end if;
    select id from public.st_users where user_name = usrname into usrid;
    if ( usrid is null)
    then
        raise warning 'User not exist!';
        return false;
    end if;
    select id from public.st_funcs where func_name = fncname into fncid;
    if ( fncid is null )
    then
        raise warning 'Function not exist!';
        return false;
    end if;
    select count(*) into fa_count from public.st_user_funcs where user_id = usrid and func_id = fncid;
    if ( fa_count = 0 )
    then
        return false;
    else
        return true;
    end if;
end;
$$ LANGUAGE 'plpgsql';