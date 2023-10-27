SELECT *
FROM dbo.Uncleaned_DS_jobs$

--remove duplicate

delete from dbo.Uncleaned_DS_jobs$
where rating in (
                select MAX(rating)
                from dbo.Uncleaned_DS_jobs$
                group by rating, [Salary Estimate], [company name], [Location], [Size], [Founded], [Type of ownership], [Industry], [Sector], [Revenue], [Competitors]
                having count(*) > 1)

-- remove nulls

select *
from dbo.Uncleaned_DS_jobs$
where Industry is null
or [Sector] is null

delete from dbo.Uncleaned_DS_jobs$
where Industry is null
or [Sector] is null
or [Competitors] is null
or [Headquarters] is null

-- Delete columns

alter table dbo.Uncleaned_DS_jobs$
drop column sector, competitors