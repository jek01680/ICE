drop view v_resmanage;
drop view v_memForReserve;
drop view v_resForReserve;
drop view v_resreserve;

create or replace view v_resmanage
as
select re.*, rk.rkkind from resmanage re, reskind rk
where re.rkno = rk.rkno
and re.RESSTATE != 'del';

create or replace view v_memForReserve
as
select me.memno, me.name, de.deptname, po.posname  from member me join department de
on me.deptcode=de.deptcode
join position po
on me.poscode=po.poscode;

create or replace view v_resForReserve 
as
select rm.resno, rm.resname, rk.rkno, rk.rkkind,
    rs.rvno, rs.rvstart, rs.rvend, rs.rvstate, rs.rvregdate, rs.memno, rs.rvcantreason
from resmanage rm join reskind rk
on rm.rkno=rk.rkno
join resreserve rs
on rm.resno=rs.resno;

create or replace view v_resreserve
as
select res.*, mem.name, mem.deptname, mem.posname from v_memForReserve mem, v_resForReserve res
where mem.memNo=res.memno;


select * from v_resmanage;
select * from v_resreserve;
