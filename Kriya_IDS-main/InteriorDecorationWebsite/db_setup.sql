-- Database Setup Script for InteriorDecorationWebsite

IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'InteriorDecorationDB')
BEGIN
    CREATE DATABASE InteriorDecorationDB;
END
GO

USE InteriorDecorationDB;
GO

-- 1. tbl_users
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_users')
BEGIN
    CREATE TABLE tbl_users (
        Id INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Email NVARCHAR(100) NOT NULL UNIQUE,
        Password NVARCHAR(100) NOT NULL,
        Mobile NVARCHAR(20) NOT NULL,
        Role NVARCHAR(20) NOT NULL DEFAULT 'User'
    );
END
GO

-- 2. tbl_category
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_category')
BEGIN
    CREATE TABLE tbl_category (
        CategoryId INT IDENTITY(1,1) PRIMARY KEY,
        CategoryName NVARCHAR(100) NOT NULL,
        CategoryImage NVARCHAR(255) NOT NULL DEFAULT 'default-category.jpg'
    );
END
GO

-- 3. tbl_products
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_products')
BEGIN
    CREATE TABLE tbl_products (
        ProductId INT IDENTITY(1,1) PRIMARY KEY,
        ProductName NVARCHAR(150) NOT NULL,
        CategoryId INT NOT NULL FOREIGN KEY REFERENCES tbl_category(CategoryId) ON DELETE CASCADE,
        Price DECIMAL(18,2) NOT NULL,
        Description NVARCHAR(MAX) NULL,
        ProductImage NVARCHAR(255) NOT NULL DEFAULT 'default-product.jpg'
    );
END
GO

-- 4. tbl_wishlist
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_wishlist')
BEGIN
    CREATE TABLE tbl_wishlist (
        WishlistId INT IDENTITY(1,1) PRIMARY KEY,
        UserId INT NOT NULL FOREIGN KEY REFERENCES tbl_users(Id) ON DELETE CASCADE,
        ProductId INT NOT NULL FOREIGN KEY REFERENCES tbl_products(ProductId) ON DELETE CASCADE
    );
END
GO

-- 5. tbl_cart
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_cart')
BEGIN
    CREATE TABLE tbl_cart (
        CartId INT IDENTITY(1,1) PRIMARY KEY,
        UserId INT NOT NULL FOREIGN KEY REFERENCES tbl_users(Id) ON DELETE CASCADE,
        ProductId INT NOT NULL FOREIGN KEY REFERENCES tbl_products(ProductId) ON DELETE CASCADE,
        Quantity INT NOT NULL DEFAULT 1,
        AddedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

-- 6. tbl_contact
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'tbl_contact')
BEGIN
    CREATE TABLE tbl_contact (
        ContactId INT IDENTITY(1,1) PRIMARY KEY,
        Name NVARCHAR(100) NOT NULL,
        Email NVARCHAR(100) NOT NULL,
        Subject NVARCHAR(200) NOT NULL,
        Message NVARCHAR(MAX) NOT NULL,
        SubmittedDate DATETIME NOT NULL DEFAULT GETDATE()
    );
END
GO

-- Seed Data
IF NOT EXISTS (SELECT * FROM tbl_users WHERE Email = 'admin@interiors.com')
BEGIN
    INSERT INTO tbl_users (Name, Email, Password, Mobile, Role) 
    VALUES ('Studio Administrator', 'admin@interiors.com', 'admin123', '9876543210', 'Admin');
END

IF NOT EXISTS (SELECT * FROM tbl_users WHERE Email = 'user@interiors.com')
BEGIN
    INSERT INTO tbl_users (Name, Email, Password, Mobile, Role) 
    VALUES ('Sophia Bennett', 'user@interiors.com', 'user123', '9123456789', 'User');
END

IF (SELECT COUNT(*) FROM tbl_category) = 0
BEGIN
    INSERT INTO tbl_category (CategoryName, CategoryImage) VALUES 
    ('Living Room', 'living-room.jpg'),
    ('Bedroom', 'bedroom.jpg'),
    ('Modular Kitchen', 'kitchen.jpg'),
    ('Office & Studio', 'office.jpg');
END

IF (SELECT COUNT(*) FROM tbl_products) = 0
BEGIN
    INSERT INTO tbl_products (ProductName, CategoryId, Price, Description, ProductImage) VALUES 
    ('Royal Velvet Sofa', 1, 1299.99, 'Plush velvet 3-seater sofa with gold brass accents.', 'sofa.jpg'),
    ('Marble Coffee Table', 1, 450.00, 'Carrara marble top coffee table with solid walnut frame.', 'coffee-table.jpg'),
    ('Emperador Accent Chair', 1, 380.00, 'Ergonomic leather armchair with brushed bronze legs.', 'accent-chair.jpg'),
    ('King Size Upholstered Bed', 2, 1599.00, 'Handcrafted tufted headboard king bed with storage.', 'king-bed.jpg'),
    ('Minimalist Sliding Wardrobe', 2, 899.50, 'Custom matte finish wardrobe with integrated LED strips.', 'wardrobe.jpg'),
    ('Nordic Nightstand', 2, 220.00, 'Oak wood bedside table with soft-close drawers.', 'nightstand.jpg'),
    ('L-Shape Luxury Kitchen', 3, 3499.00, 'Modular kitchen with quartz countertops & soft close hardware.', 'l-kitchen.jpg'),
    ('Granite Island Unit', 3, 1150.00, 'Freestanding kitchen island with wine rack and seating bar.', 'kitchen-island.jpg'),
    ('Ergonomic Executive Chair', 4, 349.99, 'High-back mesh chair with lumbar support.', 'office-chair.jpg'),
    ('Solid Oak Executive Desk', 4, 750.00, 'Spacious study desk with cable management & wireless charger.', 'office-desk.jpg'),
    ('Sculptural Pendant Lamp', 1, 195.00, 'Modern geometric brass chandelier for living areas.', 'pendant-lamp.jpg'),
    ('Hand-Woven Wool Rug', 1, 290.00, 'Premium plush floor rug in neutral ivory tones.', 'wool-rug.jpg');
END
GO
