create view v_tp as
select st.id, st.tp_name, st.grp_id, sg.grp_name from st_tp st , st_grp sg
where st.grp_id = sg.id 