-- Rename the birt_dathe column to birth_date

EXEC sp_rename 'persons.birt_dathe', 'birth_date', 'COLUMN';
