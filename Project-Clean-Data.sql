/****** Script for SelectTopNRows command from SSMS  ******/
SELECT TOP (1000) [UniqueID ]
      ,[ParcelID]
      ,[LandUse]
      ,[PropertyAddress]
      ,[SaleDate]
      ,[SalePrice]
      ,[LegalReference]
      ,[SoldAsVacant]
      ,[OwnerName]
      ,[OwnerAddress]
      ,[Acreage]
      ,[TaxDistrict]
      ,[LandValue]
      ,[BuildingValue]
      ,[TotalValue]
      ,[YearBuilt]
      ,[Bedrooms]
      ,[FullBath]
      ,[HalfBath]
  FROM [dataproject].[dbo].[Housing]

 -- cleaning data in SQL 

 select * 
 from dataproject..housing

 -- standardliza data format

 select SaleDate, CONVERT(Date, SaleDate)
 from dataproject..housing

update dataproject..housing
 set SaleDate = CONVERT(Date, SaleDate)


 alter table dataproject..housing
 add SaleDateConverted Date;

 update housing
 set SaleDateConverted = CONVERT(Date, SaleDate)

 select SaleDateConverted ,CONVERT(Date, SaleDate)
 from dataproject..housing

 --populate property address date
 select PropertyAddress
 from dataproject..housing

 
 select PropertyAddress
 from dataproject..housing
 where PropertyAddress is null

 select *
 from dataproject..housing
 --where PropertyAddress is null
 order by ParcelID

 select a.ParcelID, a.PropertyAddress, b.ParcelID, b.PropertyAddress, ISNULL(a.propertyaddress, b.PropertyAddress)
 from dataproject..housing a
 join dataproject..housing b
 on a.ParcelID = b.ParcelID
 and a.[UniqueID ] <> b.[UniqueID ]
 where a.PropertyAddress is null

 update a
 set PropertyAddress = ISNULL(a.propertyaddress, b.PropertyAddress)
 from dataproject..housing a
 join dataproject..housing b
 on a.ParcelID = b.ParcelID
 and a.[UniqueID ] <> b.[UniqueID ]
 where a.PropertyAddress is null

 --breaking out address into individual columns (address, city, state)
 
 
 select PropertyAddress
 from dataproject..housing

 select 
 SUBSTRING(propertyaddress, 1, CHARINDEX(',', PropertyAddress)-1) as address,
 SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress)) as address
 
 from dataproject..housing

  alter table dataproject..housing
 add PropertySplitAddress nvarchar(225);

 update housing
 set PropertySplitAddress = SUBSTRING(propertyaddress, 1, CHARINDEX(',', PropertyAddress)-1)
 

  alter table dataproject..housing
 add PropertySplitCity nvarchar(255);

 update housing
 set PropertySplitCity = SUBSTRING(propertyaddress, CHARINDEX(',', PropertyAddress) + 1, LEN(PropertyAddress))
 add PropertySplitCity nvarchar(255);

 select * 
 from dataproject..housing

 select OwnerAddress 
 from dataproject..housing

 select PARSENAME(REPLACE(OwnerAddress,',', '.'),3),
 PARSENAME(REPLACE(OwnerAddress,',', '.'),2),
 PARSENAME(REPLACE(OwnerAddress,',', '.'),1)
 from dataproject..housing

   alter table dataproject..housing
 add OwnerSplitAddress nvarchar(225);

 update housing
 set OwnerSplitAddress = PARSENAME(REPLACE(OwnerAddress,',', '.'),3)

  alter table dataproject..housing
 add OwnerSplitCity nvarchar(255);

 update housing
 set OwnerSplitCity = PARSENAME(REPLACE(OwnerAddress,',', '.'),2)

 alter table dataproject..housing
 add OwnerSplitState nvarchar(255);

 update housing
 set OwnerSplitState = PARSENAME(REPLACE(OwnerAddress,',', '.'),1)

 select * 
 from dataproject..housing

 --change Y and N to Yes and No in "Sold as Vacant" field

 select distinct(SoldAsVacant), COUNT(SoldAsVacant)
  from dataproject..housing
  group by SoldAsVacant
  order by 2


select SoldAsVacant , 
case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
	End
from dataproject..housing

update dataproject..housing
Set SoldAsVacant = case when SoldAsVacant = 'Y' then 'Yes'
	when SoldAsVacant = 'N' then 'No'
	else SoldAsVacant
	End


--remove duplicate

with RowNumCTE as(
 select * ,
	ROW_NUMBER() over ( 
	partition by ParcelID,
				propertyaddress,
				saleprice,
				saledate,
				legalReference
				order by 
					uniqueID
					) row_num
from dataproject..housing
--order by ParcelID
)
select *
from RowNumCTE
--where row_num > 1
order by PropertyAddress


 select * 
  from dataproject..housing

  -- Delect unsused columns

  select * 
  from dataproject..housing

  alter table dataproject..housing
  drop column Owneraddress, TaxDistrict, PropertyAddress