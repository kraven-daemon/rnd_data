-- Laboratoire01
--
-- Running 'mcr.microsoft.com/mssql/server:2019-latest' image from dockerhub on wsl as Ubuntu-20.04 with rootless podman container.

-- 1) Créer la base de données BDRona. --
CREATE DATABASE BDRona
GO

-- 2) Renommer la base de données nommée BDRona. Le nouveau nom est Rona.
ALTER DATABASE BDRona MODIFY NAME = Rona
GO

-- 3) Afficher la définition de la base de données Rona.
SELECT * FROM sys.databases WHERE NAME = Rona
GO

-- 4) Utiliser la base de données Rona.
USE Rona
GO
PRINT DB_NAME()
GO

-- 5) Créer la table Client dans la base de données Rona.
CREATE TABLE Client(
    No_Client Int,
    Nom varchar(50),
    Ville Int,
    NAS Char(9)
)
GO

-- 6) Créer la table Regions dans la base de données Rona.
CREATE TABLE Regions
(
     No_region Int,
     Nom Varchar(50)
)
GO

-- 7) Créer la table Commandes dans la base de données Rona.
CREATE TABLE Commandes
(
     No_commande Int,
     No_client Int,
     Date Date,
     Montant Money
)
GO
-- 8) Créer la table Produits dans la base de données Rona.
CREATE TABLE Produits
(
     No_produits Int,
     Nom_produit Varchar(20),
     Quantite Int
)
GO

-- 9) Modifier le type de données de la colonne Ville de Int à Varchar(50).
-- SELECT * FROM INFORMATION_SCHEMA.TABLES
-- GO
ALTER TABLE Client
    ALTER COLUMN Ville Varchar(50)
GO

-- 10) Supprimer la colonne NAS.
ALTER TABLE Client
    DROP COLUMN NAS
GO

-- 11) Ajouter le numéro de téléphone du client dans la table Client (colonne Telephone varchar(10)).
ALTER TABLE Client
    ADD Telephone varchar(12) -- <-- J'ai mis 12 sinon les tirets du numero de Telephone ne rentre pas.
GO

-- 12) Peupler la table Client avec les données fournis.
INSERT INTO Client VALUES(10, "Frigobec", "Montreal", "514-820-1010")
INSERT INTO Client VALUES(20 "Eltrobec" "Brossard" "450-820-2020")
INSERT INTO Client VALUES(40 "Toiturebec" "Montréal" "514-820-4040")
INSERT INTO Client VALUES(30 "Plancherbec" "Laval" "450-820-3030")
GO

-- 13)Peupler la table Commandes avec les données fournis.
INSERT INTO Commandes VALUES(1000, 10, "09/01/2020", 803.22)
INSERT INTO Commandes VALUES(1001, 30, "04/02/2020", 1023.89)
INSERT INTO Commandes VALUES(1002, 20, "23/02/2020", 2340.00)
INSERT INTO Commandes VALUES(1003, 10, "04/03/2020", 13000.23)
INSERT INTO Commandes VALUES(1004, 20, "01/05/2020", 2230.88)
INSERT INTO Commandes VALUES(1005, 40, "22/04/2019", 9320.22)
INSERT INTO Commandes VALUES(1006, 30, "22/05/2019", 100)
INSERT INTO Commandes VALUES(1007, 40, "19/10/2019", 200)
GO

-- 14)Renommer la colonne Date pour Date_facturation dans la table Commandes.
EXEC sp_rename 'Commandes.Date', 'Date_facturation', 'COLUMN'
GO

-- 15)Renommer la table Client pour Clients.
EXEC sp_rename 'Client', 'Clients'
GO

-- 16)Supprimer la table Regions.
DROP TABLE Regions
GO

-- 17)Afficher la définition (structure) de la table Commandes.
EXEC sp_help Commandes
GO

-- 18)Supprimer la base de données Rona.
DROP DATABASE Rona
GO
