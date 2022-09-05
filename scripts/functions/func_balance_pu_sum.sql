CREATE OR REPLACE FUNCTION func_balance_pu_sum(x int, sd text, ed text) RETURNS numeric AS
$$
DECLARE
ec1 numeric;
ec2 numeric;
BEGIN
    select wpv.pu_value from wt_pu_values wpv
    where wpv.pu_id = x and wpv.value_date <= to_date(ed, 'YYYY-mm-dd')
    order by wpv.value_date desc limit 1 into ec1;
    if ( ec1 is null )
	then
		ec1 := 0;
	end if; 
    select wpv.pu_value from wt_pu_values wpv
    where wpv.pu_id = x and wpv.value_date <= to_date(sd, 'YYYY-mm-dd')
    order by wpv.value_date desc limit 1 into ec2;
    if ( ec2 is null )
	then
		ec2 := 0;
	end if; 
    if ec1-ec2 < 0
    then
        return 0;
    end if;
    return ec1-ec2;
END
$$ LANGUAGE 'plpgsql';