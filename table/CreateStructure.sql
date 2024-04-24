create table dbo.SKU (
  ID int not null identity,
  Code as 's' + CAST(ID AS varchar(50)),
  Name varchar(100),
  constraint PK_SKU primary key (ID) 
  )

alter table dbo.SKU add constraint UK_SKU_Code unique (Code)

create table dbo.Family (
  ID int not null identity,
  SurName varchar(50),
  BudgetValue decimal(20, 2),
  constraint PK_Family primary key (ID) 
  )

create table dbo.Basket (
  ID int not null identity, 
  ID_SKU int not null, 
  ID_Family int not null (Внешний ключ на таблицу dbo.Family) 
  Quantity int check (Quantity >= 0), 
  Value decimal(20, 2) check (Value >= 0) , 
  PurchaseDate date, 
  DiscountValue decimal(20, 2),
  constraint PK_Basket primary key (ID)
  )

alter table dbo.Basket add constraint FK_Basket_ID_SKU_SKU foreign key (ID_SKU) references dbo.SKU(ID)
alter table dbo.Basket add constraint FK_Basket_ID_Family_Family foreign key (ID_Family) references dbo.Family(ID)
alter table dbo.Basket add constraint DF_Basket_PurchaseDate default getdate() for PurchaseDate
