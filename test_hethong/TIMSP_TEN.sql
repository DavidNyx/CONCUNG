use CONCUNG
go
Select TEN_SP from 
SANPHAM
where TEN_SP like N'T�' 
go

use CONCUNG_INDEX_PARTITION
go
Select TEN_SP from 
SANPHAM
where TEN_SP like N'T�' 
go

use CONCUNG_INDEX_PARTITION
go
exec TIMSP_BANGTEN N'T�' 