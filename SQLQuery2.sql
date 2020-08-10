CREATE DATABASE Quan_ly_sinh_vien
go

use Quan_ly_sinh_vien
go
-- tạo bảng
create table Khoa
(
ma_khoa varchar(10) primary key,
ten_khoa nvarchar(100) not null, 
nam_thanhlap int
)
go
create table Chuong_trinh
(
ma_ct varchar(10) primary key,
ten_chuong_trinh nvarchar(100) not null
)
go
create table Khoa_hoc
(
ma_kh varchar(10) primary key, 
nam_bat_dau int,
nam_ket_thuc int
)
go
create table Giang_khoa
(
ma_mh varchar(10) not null, 
ma_ct varchar(10),
ma_khoa varchar(10),
ten_mh nvarchar(100) not null,
so_tiet_lt int,
so_tiet_th int,
so_tinchi int,
primary key (ma_mh, ma_ct, ma_khoa),
foreign key (ma_ct) references Chuong_trinh(ma_ct),
foreign key (ma_khoa) references Khoa(ma_khoa)

)
go
create table Lop_hoc
(
ma_lophoc varchar(10) primary key,
ma_kh varchar(10),
ma_ct varchar(10) not null,
ma_khoa varchar(10) not null,
stt int,
foreign key (ma_kh) references Khoa_hoc(ma_kh),
foreign key (ma_ct) references Chuong_trinh(ma_ct),
foreign key (ma_khoa) references Khoa(ma_khoa)
)
go
create table Sinh_vien
(
ma_sv varchar(10) primary key,
ho_ten nvarchar(100) not null, 
nam_sinh int,
dan_toc nvarchar(20),
ma_lophoc varchar(10),
foreign key (ma_lophoc) references Lop_hoc(ma_lophoc)
)
go
create table Ket_qua
(
ma_mh varchar(10),
ma_ct varchar (10),
ma_khoa varchar(10),
ma_sv varchar(10),
lan_thi int,
thoi_gian date,
ket_qua int,
primary key (ma_mh, ma_sv, lan_thi),
foreign key (ma_mh, ma_ct, ma_khoa) references Giang_khoa(ma_mh,ma_ct,ma_khoa),
foreign key(ma_sv) references Sinh_vien(ma_sv)
)
go
ALTER TABLE Ket_qua
alter column ket_qua float
go


-- nhap co so du lieu
insert Khoa (ma_khoa, ten_khoa, nam_thanhlap)
values('CNTT', N'Cong_nghe_thong_tin', 1995)
go
insert Khoa (ma_khoa, ten_khoa, nam_thanhlap)
values('VL', N'Vat_ly', 1970)
go
--nhap bang khoa hoc
insert Khoa_hoc(ma_kh, nam_bat_dau, nam_ket_thuc)
values('K2002', 2002, 2006)
go
insert Khoa_hoc(ma_kh, nam_bat_dau, nam_ket_thuc)
values('K2003', 2003, 2007)
go
insert Khoa_hoc(ma_kh, nam_bat_dau, nam_ket_thuc)
values('K2004', 2004, 2008)
go
-- nhap bang chuong trinh
insert Chuong_trinh(ma_ct, ten_chuong_trinh)
values('CQ', N'Chinh_quy')
go
-- nhap bang lop hoc
insert Lop_hoc(ma_lophoc, ma_kh, ma_khoa, ma_ct, stt)
values('TH2002/01','K2002','CNTT','CQ', 1)
go
insert Lop_hoc(ma_lophoc, ma_kh, ma_khoa, ma_ct, stt)
values('TH2002/02','K2002','CNTT','CQ', 2)
go
insert Lop_hoc(ma_lophoc, ma_kh, ma_khoa, ma_ct, stt)
values('TH2003/01','K2003','VL','CQ', 1)
go
--nhap bang monhoc
insert Giang_khoa(ma_mh,ma_ct, ma_khoa,ten_mh,so_tiet_lt,so_tiet_th,so_tinchi)
values('THT01','CQ','CNTT',N'Toan_cao_cap_A1', 60,30,5)
go

insert Giang_khoa(ma_mh,ma_ct, ma_khoa,ten_mh,so_tiet_lt,so_tiet_th,so_tinchi)
values('THT02','CQ','CNTT',N'Toan roi rac', 45,30,4)
go
insert Giang_khoa(ma_mh,ma_ct, ma_khoa,ten_mh,so_tiet_lt,so_tiet_th,so_tinchi)
values('THCS01','CQ','CNTT',N'Cau_truc_du_lieu_01', 45,30,4)
go
-- nhap bang sinh vien
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0212001',N'Nguyen_Vinh_An',1994,N'Kinh', 'TH2002/01')
go
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0212002',N'Nguyen_Thanh_Binh',1985,N'Kinh', 'TH2002/01')
go
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0212003',N'Nguyen_Thanh_Cuong',1984,N'Kinh', 'TH2002/02')
go
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0212004',N'Nguyen_Quoc_Duy',1983,N'Kinh', 'TH2002/02')
go
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0312001',N'Pham_quoc_anh',1985,N'Kinh', 'TH2003/01')
go
insert Sinh_vien(ma_sv,ho_ten,nam_sinh, dan_toc, ma_lophoc)
values('0312002',N'Huynh_Thanh_Sang',1984,N'Kinh', 'TH2003/01')
go
--nhap bang ket qua thi
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT01','CQ','CNTT','0212001',1,'20030201',4)
go

insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT01','CQ','CNTT','0212001',2,'20030301',7)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT01','CQ','CNTT','0212002',1,'20030201',8)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT01','CQ','CNTT','0212003',1,'20030201',6)
go

insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT01','CQ','CNTT','0212004',1,'20030201',9)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT02','CQ','CNTT','0212001',1,'20030201',8)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT02','CQ','CNTT','0212002',1,'20030201',5.5)
go

insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT02','CQ','CNTT','0212003',1,'20030201',4)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THT02','CQ','CNTT','0212003',2,'20030201',6)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THCS01','CQ','CNTT','0212001',1,'20030201',6.5)
go

insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THCS01','CQ','CNTT','0212002',1,'20030201',4)
go
insert Ket_qua(ma_mh,ma_ct,ma_khoa,ma_sv,lan_thi,thoi_gian, ket_qua)
values('THCS01','CQ','CNTT','0212003',1,'20030201',7)
go

-- truy van kiem tra
select* from Khoa
go
select * from Khoa_hoc
go
select* from Lop_hoc
go
select * from Chuong_trinh
go
select * from Giang_khoa
go
select * from Sinh_vien
go
select * from Ket_qua
go

-- truy van danh sach sinh vien cntt khoa 2002 - 2006
-- lay theo truy van dieu kien thong thuong

select SV.* from Sinh_vien as SV
left join Lop_hoc as LH on SV.ma_lophoc = LH.ma_lophoc
left join Khoa as K on K.ma_khoa = LH.ma_khoa 
left join Khoa_hoc as KH on KH.ma_kh = LH.ma_kh 
where
K.ma_khoa = 'CNTT'
and KH.nam_bat_dau = 2002 
and KH.nam_ket_thuc = 2006
go
-- truy van dung dieu kien ngay sau on: khong dùng được điều kiện thêm sau on
select SV.* from Sinh_vien as SV
left join Lop_hoc as LH on SV.ma_lophoc = LH.ma_lophoc
left join Khoa as K on K.ma_khoa = LH.ma_khoa and K.ma_khoa = 'CNTT'
left join Khoa_hoc as KH on KH.ma_kh = LH.ma_kh and KH.nam_bat_dau = 2002 
go
select SV.ma_sv, SV.ho_ten, SV.nam_sinh from Sinh_vien as SV
left join Lop_hoc as LH on SV.ma_lophoc = LH.ma_lophoc
left join Khoa_hoc as KH on KH.ma_kh = LH.ma_kh
where
KH.nam_bat_dau - SV.nam_sinh < 18
go

-- cho biet sinh vien kh CNTT chua hoc mon "cau truc du lieu 01"
select * from Ket_qua
go
-- lay ma mh 
select * from Ket_qua
go


select distinct sv.* from Sinh_vien as sv
left join Lop_hoc as lh on lh.ma_lophoc = sv.ma_lophoc
left join Khoa as k on k.ma_khoa = lh.ma_khoa
left join Khoa_hoc as kh on kh.ma_kh = lh.ma_kh
left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
where 
k.ma_khoa = 'CNTT'
and kh.nam_bat_dau = 2002
and kq.ma_mh != 'THCS01'
go

-- danh sach sinh vien cntt khoa 2002 - 2006 va cac mon da hoc

select distinct  sv.*, kq.ma_mh from Sinh_vien as sv
left join Lop_hoc as lh on lh.ma_lophoc = sv.ma_lophoc
left join Khoa as k on k.ma_khoa = lh.ma_khoa
left join Khoa_hoc as kh on kh.ma_kh = lh.ma_kh
left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
where 
k.ma_khoa = 'CNTT'
and kh.nam_bat_dau = 2002
go

-- cho biet sinh vien khong thi dau (diem <5) mon cau truc du lieu nhung chua thi lai
-- danh sach sinh vien thi mon Cau truc du lieu

select sv.*, kq.ma_mh, kq.ket_qua, kq.lan_thi from Sinh_vien as sv
left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
left join Giang_khoa as gk on gk.ma_mh = kq.ma_mh
where gk.ten_mh like 'Cau%'
      and kq.ket_qua < 5
      and not exists 
(select sv.*, kq.ma_mh, kq.ket_qua, kq.lan_thi from Sinh_vien as sv
left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
left join Giang_khoa as gk on gk.ma_mh = kq.ma_mh
where 
gk.ten_mh like 'Cau%'
and kq.lan_thi >=2)
go

-- Với mỗi lớp thuộc khoa CNTT, cho biết mã lớp, mã khóa học, tên chương trình và số sinh viên thuộc lớp đó 
-- dem sinh vien theo hoc cac lop
select lh.ma_lophoc,lh.ma_khoa, ct.ten_chuong_trinh, count(sv.ho_ten) as ssv from Sinh_vien as sv, Lop_hoc as lh, Khoa as k, Chuong_trinh as ct, Khoa_hoc as kh
where 
lh.ma_lophoc = sv.ma_lophoc
and lh.ma_khoa = k.ma_khoa
and lh.ma_kh = kh.ma_kh
and lh.ma_ct = ct.ma_ct
and k.ma_khoa = 'CNTT'
group by lh.ma_lophoc,lh.ma_khoa, ct.ten_chuong_trinh
go
-- mục đích group by bởi vì có sử dụng hàm đếm, nên cần group by để nhóm các thông tin cần đếm lại với nhau, và khi đó SQL mới thể hiện được hiệu quả của việc đếm
-- Cho biết điểm trung bình của cac lan thi cua sinh viên có mã số 0212003 (điểm trung bình chỉ tính trên lần thi sau cùng của sinh viên) 

-- cho biết điểm thi trung bình của sinh viên có msv 0212003 (điểm trung bình chỉ tính trên lần thi sau cùng)
select AVG(kq.ket_qua) as [Trung bình điểm] from Ket_qua as kq 
	inner join 
	(
	select ma_mh,kq.ma_sv, max(lan_thi) as lasttime from Ket_qua as kq
	group by ma_mh, kq.ma_sv having kq.ma_sv = '0212003'
	) kq2 on kq2.ma_mh = kq.ma_mh and kq2.lasttime = kq.lan_thi 
where kq.ma_sv = '0212003' 
go
-- fuction in sql : Với 1 mã sinh viên và 1 mã khoa, kiểm tra xem sinh viên có thuộc khoa này không (trả về đúng hoặc sai)
-- tao query chinh
declare @sinhvien varchar(10)
declare @khoa varchar(10)
declare @ketqua varchar(10)
set @sinhvien = '0212003'
set @khoa = 'CNTT'
if (
	exists 
		(
		select sv.* from Sinh_vien as sv 
		left join Lop_hoc as lh on sv.ma_lophoc = lh.ma_lophoc
		left join Khoa as k on k.ma_khoa = lh.ma_khoa
		where sv.ma_sv = @sinhvien and k.ma_khoa = @khoa
		)
	)
	set @ketqua = 'True'
else 
	set @ketqua = 'False'
print @ketqua
go
-- tao function

create function KFC_check_sinhvien_in_khoa
( @sinhvien varchar(10), @khoa varchar(10)
)
returns varchar(10)
as
begin
declare @ketqua varchar(10)
if (exists (select sv.* from Sinh_vien as sv 
	left join Lop_hoc as lh on sv.ma_lophoc = lh.ma_lophoc
	left join Khoa as k on k.ma_khoa = lh.ma_khoa
	where sv.ma_sv = @sinhvien and k.ma_khoa = @khoa))
set @ketqua = 'True'
else 
set @ketqua = 'False'
return @ketqua
end;
go

select dbo.KFC_check_sinhvien_in_khoa('0212003', 'CNTT')
go

-- Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
-- query chính
declare @masv varchar(10)
declare @mamh varchar(10)
set @masv = '0212003'
set @mamh = 'THT02'
select kq.ma_sv,kq.ma_mh, max(kq.lan_thi) as lasttime from Ket_qua as kq
group by  kq.ma_sv,kq.ma_mh
having kq.ma_sv = @masv and kq.ma_mh = @mamh
go
-- function
create function KFC_tinh_diemthi
(
 @masv varchar(10), @mamh varchar(10)
)
returns float
as
begin
declare @ketqua float
select @ketqua = ketqua.ket_qua from (select kq.ma_sv,kq.ma_mh, kq.ket_qua, max(kq.lan_thi) as lasttime from Ket_qua as kq
left join Sinh_vien as sv on sv.ma_sv = kq.ma_sv
left join Giang_khoa as gk on gk.ma_mh = kq.ma_mh
group by  kq.ma_sv,kq.ma_mh, kq.ket_qua
having kq.ma_sv = @masv and kq.ma_mh = @mamh) as ketqua
return @ketqua
end;
go
-- chạy
select dbo.KFC_tinh_diemthi('0212003','THT02')
go
-- function 2

create function Kfc_tinh_diemthi
(
 @masv varchar(10), @mamh varchar(10)
)
returns float
as
begin
declare @ketqua float
select @ketqua = Ket_qua.ket_qua from Ket_qua 
	inner join 
	(select kq.ma_sv,kq.ma_mh, max(kq.lan_thi) as lasttime from Ket_qua as kq, Sinh_vien as sv, Giang_khoa as gk
	where sv.ma_sv = kq.ma_sv and gk.ma_mh = kq.ma_mh group by  kq.ma_sv,kq.ma_mh having kq.ma_sv = @masv and kq.ma_mh = @mamh) as ketqua 
	on Ket_qua.ma_sv = ketqua.ma_sv and Ket_qua.lan_thi = ketqua.lasttime
return @ketqua
end;
go
select dbo.Kfc_tinh_diemthi('0212003','THT02') as [Điểm sau cùng]
go

-- tính điểm trung bình của 1 sinh viên, điểm chỉ tính trên lần thi sau cùng
create function Kfc_diemtrungbinh
(
 @masv varchar(10)
)
returns float
as
begin
declare @ketqua float
select @ketqua = avg(Ket_qua.ket_qua) from Ket_qua 
	inner join 
	(select kq.ma_sv,kq.ma_mh, max(kq.lan_thi) as lasttime from Ket_qua as kq 
	 group by  kq.ma_sv,kq.ma_mh having kq.ma_sv = @masv) as ketqua 
	on Ket_qua.ma_sv = ketqua.ma_sv and Ket_qua.lan_thi = ketqua.lasttime and Ket_qua.ma_mh = ketqua.ma_mh
return @ketqua
end;
go

select dbo.Kfc_diemtrungbinh('0212003') as [Điểm trung bình sau cùng]
go
-- Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó
declare @sv varchar(10)
declare @mh varchar(10)
set @sv = '0212003'
set @mh = 'THT02'
select kq.lan_thi ,kq.ket_qua  from Ket_qua as kq where kq.ma_sv = @sv and kq.ma_mh = @mh
go
drop function KFC_ketquatheolanthi
go
-- 4. Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó
create function KFC_ketquatheolanthi
(@sv varchar(10), @mh varchar(10))
returns table
return select kq.lan_thi ,kq.ket_qua  from Ket_qua as kq where kq.ma_sv = @sv and kq.ma_mh = @mh
go

select * from  dbo.KFC_ketquatheolanthi('0212003','THT02')
go
-- 5. nhập vào 1 sinh viên, trả về danh sách các môn sinh viên này phải học
select * from Lop_hoc
go
backup database KienSQL to disk = 'D:\KienSQL'
go
select * from Khoa_hoc
go
select * from Sinh_vien
go

-- Cho biết các thông tin (MSSV, họ tên ,năm sinh) của các sinh viên học sớm hơn tuổi quy định (theo tuổi quy định thi sinh viên đủ 18 tuổi khi bắt đầu khóa học)
select * from Sinh_vien as sv
	left join Lop_hoc as lh on lh.ma_lophoc = sv.ma_lophoc
	left join Khoa_hoc as kh on kh.ma_kh = lh.ma_kh
where kh.nam_bat_dau - sv.nam_sinh < 18
go
-- Cho biết sinh viên khoa CNTT, khoá 2002-2006 chưa học môn cấu trúc dữ liệu 1

select distinct sv.* from Sinh_vien as sv
	left join Lop_hoc as lh on lh.ma_lophoc = sv.ma_lophoc
	left join Khoa as k on k.ma_khoa = lh.ma_khoa
	left join Khoa_hoc as kh on kh.ma_kh = lh.ma_kh
	left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
where 
	k.ma_khoa = 'CNTT'
	and kh.nam_bat_dau = '2002'
	and kq.ma_mh != 'THCS01'
go
-- cho biết sinh viên thi chưa đậu( điểm < 5 )môn cơ sở dữ liệu 1 nhưng chưa thi lại 
-- max lan thi  =  and điểm < 5

select sv.* from Sinh_vien as sv
	left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
	left join Giang_khoa as gv on gv.ma_mh = kq.ma_mh
where gv.ten_mh like N'Cau_truc_du_lieu_01'
	and kq.ket_qua < 5 
	and sv.ma_sv not in 
(
select sv.ma_sv from Sinh_vien as sv
	left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
	left join Giang_khoa as gv on gv.ma_mh = kq.ma_mh
where gv.ten_mh like N'Cau_truc_du_lieu_01'
	and kq.lan_thi >1
)
go

select sv.ma_sv, sv.ho_ten, sv.nam_sinh, count(*) as "Số lần thi" from Sinh_vien as sv
	left join Ket_qua as kq on kq.ma_sv = sv.ma_sv
	left join Giang_khoa as gk on gk.ma_mh = kq.ma_mh
where gk.ten_mh like N'Cau_truc_du_lieu_01'
and kq.ket_qua < 5
group by sv.ma_sv,sv.ho_ten,sv.nam_sinh
having count(*) = 1
go

-- Với mỗi lớp thuộc khoa CNTT, cho biết mã lớp, mã khóa học, tên chương trình và số sinh viên thuộc lớp đó 
select k.ten_khoa as Khoa, lh.ma_lophoc,lh.ma_kh, ct.ten_chuong_trinh, count(*) as So_sv from Lop_hoc  as lh
	left join Chuong_trinh as ct on ct.ma_ct = lh.ma_ct
	left join Khoa as k on k.ma_khoa = lh.ma_khoa
	left join Khoa_hoc as kh on kh.ma_kh = lh.ma_kh
where k.ten_khoa like N'Cong_nghe_thong_tin'
group by lh.ma_lophoc,lh.ma_kh,ct.ten_chuong_trinh, k.ten_khoa
go
-- Cho biết điểm trung bình của sinh viên có mã số 0212003 (điểm trung bình chỉ tính trên lần thi sau cùng của sinh viên) 
select AVG(kq.ket_qua) as Diem_trung_binh from Ket_qua as kq
inner join
	(
	select kq.ma_sv, kq.ma_mh, max(kq.lan_thi) as 'last_time' from Ket_qua as kq
	where kq.ma_sv = '0212003'
	group by kq.ma_mh,kq.ma_sv
	) table2 on kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.last_time and kq.ma_sv = table2.ma_sv
go
--  kiểm tra 1 sinh viên xem có thuộc khoa nào cho trước không
create function Check_sv
(
	@masv varchar (10),
	@makh varchar (10)

)
returns varchar(5)
as
begin
declare @ketqua varchar(5)
if ( exists 
	(select sv.ma_sv, sv.ma_lophoc from Sinh_vien as sv
		left join Lop_hoc as lh on lh.ma_lophoc = sv.ma_lophoc
		left join Khoa as k on k.ma_khoa = lh.ma_khoa
	where sv.ma_sv = @masv and k.ma_khoa = @makh)
	)
	set @ketqua = 'True'
else 
	set @ketqua = 'False'
return @ketqua
end
go

select dbo.Check_sv('0212003','CNTT')
go


-- Tính điểm thi sau cùng của một sinh viên trong một môn học cụ thể
create function Diem_thi_mh
(
@masv varchar(10),
@mamh varchar(10)
)
returns float
as
begin
declare @ketqua float
select @ketqua = table1.ket_qua from
	(select kq.ma_sv, kq.ma_mh,kq.lan_thi, kq.ket_qua  from Ket_qua as kq
		inner join 
		(select kq.ma_sv,kq.ma_mh, max(kq.lan_thi) as 'last time' from Ket_qua as kq
			where kq.ma_sv =@masv 
			group by kq.ma_sv, kq.ma_mh
		) table2 
	on kq.ma_sv = table2.ma_sv and kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.[last time]
	) table1 
where table1.ma_mh = @mamh
return @ketqua
end
go
select dbo.Diem_thi_mh('0212003','THT01')
go

-- tính điểm thi trung bình của một sinh viên cụ thể, điểm tính trung bình là điểm thi lần sau cùng
create function average_last_score
(
@masv varchar(10)
)
returns float
as
begin
declare @ket_qua float;
select @ket_qua = AVG(kq.ket_qua) from Ket_qua as kq
inner join
	(select kq.ma_sv, kq.ma_mh, max(kq.lan_thi) as 'last_time' from Ket_qua as kq
	where kq.ma_sv = @masv
	group by kq.ma_mh,kq.ma_sv
	) table2 on kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.last_time and kq.ma_sv = table2.ma_sv
return @ket_qua
end
go

select dbo.average_last_score('0212003')
go


-- tinh diem sau cung cua 1 sinh vien cho 1 mon hoc cu the
create function Last_score
(
@masv varchar(10),
@mamh varchar(10)
)
returns float
as
begin
declare @ketqua float;
select @ketqua = kq.ket_qua  from Ket_qua as kq
inner join
	(select kq.ma_sv, kq.ma_mh, max(kq.lan_thi) as 'last_time' from Ket_qua as kq
	where kq.ma_sv = @masv and kq.ma_mh = @mamh
	group by kq.ma_mh,kq.ma_sv
	) table2 on kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.last_time and kq.ma_sv = table2.ma_sv
return @ketqua
end 
go

select dbo.Last_score('0212003','THT02')
go
--c2 tính điểm thi trung bình của một sinh viên cụ thể, điểm tính trung bình là điểm thi lần sau cùng

declare @masv varchar(10)
set @masv = '0212003'
select dbo.Last_score('0212003',kq.ma_mh) from Ket_qua as kq
where kq.ma_sv = '0212003'
go

-- tinh theo kteam
create function kt_last_score
(
@masv varchar(10),
@mamh varchar(10)
)
returns float
as
begin

declare @ketqua float
set @ketqua = 0
	select @ketqua = kq.ket_qua from Ket_qua as kq
	where kq.ma_sv = @masv and kq.ma_mh = @mamh
	order by kq.lan_thi desc
return @ketqua
end
go


drop function dbo.kt_last_score
go
select dbo.kt_last_score('0212003','THT02')
go

create function kt_avg_last_score
(
@masv varchar(10)
)
returns float
as
begin
declare @ketqua float
select @ketqua = avg(dbo.kt_last_score(@masv,kq.ma_mh)) from Ket_qua as kq
where kq.ma_sv = @masv
return @ketqua
end
go

select dbo.av_last_score('0212003')
go
-- tính theo kteam vẫn mắc lỗi đó
-- Nhập vào 1 sinh viên và 1 môn học, trả về các điểm thi của sinh viên này trong các lần thi của môn học đó.
create function tra_cuu_dt
(
@masv varchar(10),
@mamh varchar(10)
)
returns table
return select kq.lan_thi, kq.ket_qua from Ket_qua as kq
where  kq.ma_sv = @masv and kq.ma_mh = @mamh
go

select * from dbo.tra_cuu_dt('0212003','THT02')
go
-- Nhập vào 1 sinh viên, trả về danh sách các môn học mà sinh viên này phải học. 
alter function tra_cuu_mh
(
@masv varchar(10)
)
returns table
return (select Giang_khoa.ten_mh from Giang_khoa 
			left join Chuong_trinh on Chuong_trinh.ma_ct = Giang_khoa.ma_ct
			left join Lop_hoc on Chuong_trinh.ma_ct = Lop_hoc.ma_ct
			left join Khoa on Khoa.ma_khoa = Lop_hoc.ma_khoa
			left join Sinh_vien on Sinh_vien.ma_lophoc = Lop_hoc.ma_lophoc
		where Sinh_vien.ma_sv = @masv)
go

select * from dbo.tra_cuu_mh('0212003')
go
select * from Sinh_vien
go

select * from Lop_hoc
go

select * from Giang_khoa
go
-- khởi tạo 1 proc trả về danh sách các sinh viên của 1 lớp học
create proc danh_sach_lh
 @malh varchar(10)
as
	select * from Sinh_vien
	where Sinh_vien.ma_lophoc = @malh
go

exec danh_sach_lh 'TH2002/01'
go

-- Nhập vào 2 sinh viên, 1 môn học, tìm xem sinh viên nào có điểm thi môn học đó lần đầu tiên là cao hơn
alter function kq_diemthi_mh
(
@sinhvien nvarchar (50),
@monhoc nvarchar(50)
)
returns float
as
begin
declare @ketqua float;
select @ketqua = kq.ket_qua  from Ket_qua as kq
left join Giang_khoa on kq.ma_mh = Giang_khoa.ma_mh
left join Sinh_vien on Sinh_vien.ma_sv = kq.ma_sv
where Sinh_vien.ho_ten = @sinhvien and Giang_khoa.ten_mh = @monhoc and kq.lan_thi =1
return @ketqua
end
go

create proc SS_KQ
@sinhvien1 nvarchar(50),
@sinhvien2 nvarchar (50),
@monhoc nvarchar(50)
as
if (select dbo.kq_diemthi_mh(@sinhvien1,@monhoc)) > (select dbo.kq_diemthi_mh(@sinhvien2,@monhoc))
print(@sinhvien1)
else 
print(@sinhvien2)
go

exec SS_KQ 'Nguyen_Vinh_An','Nguyen_Thanh_Binh','Cau_truc_du_lieu_01'
go
-- Nhập vào 1 môn học và 1 mã sv, kiểm tra xem sinh viên có đậu môn này trong lần thi đầu tiên không, nếu đậu thì xuất ra là “Đậu”, không thì xuất ra “Không đậu”

create function kq_diemthi1
(
	@sinhvien varchar (10),
	@monhoc nvarchar(50)
)
	returns float
as
begin
	declare @ketqua float;
	select @ketqua = kq.ket_qua  from Ket_qua as kq
		left join Giang_khoa on kq.ma_mh = Giang_khoa.ma_mh
		left join Sinh_vien on Sinh_vien.ma_sv = kq.ma_sv
	where Sinh_vien.ma_sv = @sinhvien and Giang_khoa.ten_mh = @monhoc and kq.lan_thi =1
	return @ketqua
end
go

alter proc KT_KQT
@masv varchar(10),
@monhoc nvarchar(50)
as
if ((select dbo.kq_diemthi1(@masv,@monhoc)) > 5) 
	print('Đậu')
else 
	print('Khong_dau')
go

exec KT_KQT '0212003','Toan roi rac'
go
-- Nhập vào 1 khoa, in danh sách các sinh viên (mã sinh viên, họ tên, ngày sinh) thuộc khoa này
create proc DS_SV_K
	@khoa nvarchar(50)
as
	select sv.ma_sv,sv.ho_ten,sv.nam_sinh from Sinh_vien as sv
		left join Lop_hoc on Lop_hoc.ma_lophoc = sv.ma_lophoc
		left join Khoa on Khoa.ma_khoa = Lop_hoc.ma_khoa
	where Khoa.ten_khoa = @khoa
go
exec DS_SV_K 'Vat_ly'
go
--Nhập vào 1 sinh viên và 1 môn học, in điểm thi của sinh viên này của các lần thi môn học đó.
-- Ví dụ:  Lần 1 : 10 Lần 2: 8
create proc DT_SV
	@sinhvien nvarchar(50),
	@monhoc nvarchar(50)
as
	select kq.lan_thi, kq.ket_qua from Ket_qua as kq
		left join Sinh_vien on Sinh_vien.ma_sv = kq.ma_sv
		left join Giang_khoa on Giang_khoa.ma_mh = kq.ma_mh
	where Sinh_vien.ho_ten = @sinhvien and Giang_khoa.ten_mh = @monhoc
go
exec DT_SV'Nguyen_Thanh_Cuong','Toan roi rac'
go
-- tạo bảng XepLoai: maSV	diemTrungBinh	ketQua	hocLuc
--Quy định : ketQua của sinh viên là ”Đạt‘ nếu diemTrungBinh (chỉ tính các môn đã có điểm) của sinh viên đó lớn hơn hoặc bằng 5 và không quá 2 môn dưới 4 điểm, ngược lại thì kết quả là không đạtĐưa dữ liệu vào bảng xếp loại. Sử dụng function 3 đã viết ở bài 4
--Đối với những sinh viên có ketQua là ”Đạt‘ thì hocLuc được xếp loại như sau:
-- diemTrungBinh >= 8 thì hocLuc là ”Giỏi” 7 < = diemTrungBinh < 8 thì hocLuc là ”Khá” Còn lại là ”Trung bình”  
-- lay ra diem thi cuoi cung cac mon cua sv
create function FK_last_score
(
@masv varchar(10)
)
returns table
return
(select kq.ma_sv,kq.ma_mh,kq.ket_qua from Ket_qua as kq
inner join
	(select kq.ma_sv, kq.ma_mh, max(kq.lan_thi) as 'last_time' from Ket_qua as kq
	where kq.ma_sv = @masv
	group by kq.ma_mh,kq.ma_sv
	) table2 on kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.last_time and kq.ma_sv = table2.ma_sv
)
go

select dbo.average_last_score('0212003')
go

-- kiểm tra sinh viên đủ điều kiện dtb
select dbo.average_last_score('0212003')
go
select dbo.Last_score('0212003','THT02')
go
declare @masv varchar(10)
set @masv = '0212003'
declare @dtb float
set @dtb = (select dbo.average_last_score(@masv))
-- lay ra danh sach diem thi cuoi cung cac mon cua 1 sv
create function last_of_score
(
@masv varchar(10)
)
returns table
return
(select kq.ma_sv,kq.ma_mh,kq.ket_qua from Ket_qua as kq
inner join
	(select kq.ma_sv, kq.ma_mh, max(kq.lan_thi) as 'last_time' from Ket_qua as kq
	where kq.ma_sv = @masv
	group by kq.ma_mh,kq.ma_sv
	) table2 on kq.ma_mh = table2.ma_mh and kq.lan_thi = table2.last_time and kq.ma_sv = table2.ma_sv
)
go
select * from dbo.last_of_score('0212003')
go
-- dieu kien day du
create function FK_KT_Ketqua
(
@masv varchar(10)
)
returns nvarchar(20)
as
begin
declare @ketqua nvarchar(20)
declare @dtb float
declare @dtd4 int
set @dtb = (select dbo.average_last_score(@masv))
set @dtd4 = (select count(*) from dbo.last_of_score(@masv) as table1 where table1.ket_qua < 4)
if 
	(@dtb >=5 and @dtd4 <=2)
	set @ketqua = N'Đạt'
else 
	set @ketqua = N'Không đạt'
return @ketqua
end
go
select dbo.FK_KT_Ketqua('0212003')
go

-- xet loại học lực
create function FK_Hocluc
(
@masv varchar(10)
)
returns nvarchar(20)
as
begin
declare @dtb float
declare @ketqua nvarchar(20)
declare @hocluc nvarchar(20)
set @ketqua = (select dbo.FK_KT_Ketqua(@masv))
set @dtb = (select dbo.average_last_score(@masv))
if 
	(@ketqua = N'Đạt')
begin
	if 
		(@dtb >= 8)
		set @hocluc = N'Giỏi'
	else
		if 
			(@dtb >= 7)
			set @hocluc = N'Khá'
		else 
			set @hocluc = N'Trung Bình'
end
else 
	set @hocluc = NULL
return @hocluc
end
go
-- tao bang ket qua sau cung
alter view Xeploai_view
as
select Sinh_vien.ma_sv as 'Masv',
dbo.average_last_score(Sinh_vien.ma_sv) as 'Diemtrungbinh',
dbo.FK_KT_Ketqua(Sinh_vien.ma_sv) as 'Ketqua',
dbo.FK_Hocluc(Sinh_vien.ma_sv) as 'Hocluc'
from Sinh_vien
go
select * from Xeploai_view
go
-- tao bang xep loai
create table Xeploai
(
	MaSV varchar(10) primary key,
	Diemtrungbinh float,
	Ketqua nvarchar(20),
	Hocluc nvarchar(20)
	foreign key(MaSV) references Sinh_vien(ma_sv)
)
go

select * from Xeploai
go

insert into Xeploai(MaSV)
select Sinh_vien.ma_sv from Sinh_vien
go

update Xeploai 
set Diemtrungbinh = dbo.average_last_score(MaSV)
go
update Xeploai
set Ketqua = dbo.FK_KT_Ketqua(MaSV)
go
update Xeploai
set Hocluc = dbo.FK_Hocluc(MaSV)
go
-- Ràng buộc
-- ChuongTrinh mà chỉ có thể là ‘CQ‘ hoặc ‘CD‘ hoặc ‘TC’
alter table Chuong_trinh
add constraint Check_MaCT check(ma_ct in ('CQ','CĐ','TC'))
go

--using trigger
create trigger Check_mact_trigger
on Chuong_trinh
for update,insert
as 
begin
	declare @mact varchar(10)
	select @mact = ma_ct from inserted
	if (@mact not in ('CQ','CĐ','Tc'))
		rollback
end
go
