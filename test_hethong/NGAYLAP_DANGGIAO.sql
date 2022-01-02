
  use CONCUNG
  go
  select NGAYLAP
  from DONHANG
  where TINHTRANG like N'Đang giao'
  go

  use CONCUNG_INDEX_PARTITION
  go
  select NGAYLAP
  from DONHANG
  where TINHTRANG like N'Đang giao'
  go


 XEMNGAYLAP_DANGGIAO