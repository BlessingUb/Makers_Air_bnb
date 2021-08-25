# Makers Air BnB
*An app for making and managing space bookings*

## **User Stories**
---

```
As a potential customer
So that I can access MakersBnB and find a space
I want to be able to sign up to MakersBnB
```

```
As space owners
So that I can advertise my space on makersbnb
I want to be able to sign up to MakersBnB
```

## Set up the database 

1. Install and set up psql if required (Homebrew: `brew install postgresql`). 
2. Connect to `psql` via the Terminal
3. Create the development and test databases using the psql commands `CREATE DATABASE makersbnb;` and `CREATE DATABASE makersbnb_test;`
4. Connect to the development database using the pqsl command `\c makers_bnb;`
5. Run the queries saved in the files `01_create_users_table.sql` and `02_create_space_table.sql`
6. Repeat step 5 after connecting to the test database: `\c makersbnb_test;`
