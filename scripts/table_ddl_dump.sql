pg_dump -U postgres -h localhost postgres -s -t st_bank -f st_bank.sql
pg_dump -U postgres -d postgres -s -c -O -n public -f all_public.sql
