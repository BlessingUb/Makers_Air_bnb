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

```
As a signed-up space owner
So that I can get my space online
I would like to list a new space
```

```
As a user
So that the customer can chose from different option of spaces per their liking
I want to list all the spaces available for the night
```

```
As a signed in space owner
So that I can identify my spaces
I want to be able to name my space
```

```
As a signed in space owner
So that it can let users know what my space contains
I want to be able to provide a description of my space
```

```
As a signed in space owner
So that customers can know how much my space costs per night
I want to list the price of my spaces per night on my description
```

```
As a space owner
So that I can fill up my calendar with bookings
I want to show potential tenants a list of dates my space is available
```

```
As a signed-up user
So that I can use a space
I would like to request to hire the space for one night
```

```
As a space owner
So that I can manage my spaces
I would like to approve a user request to hire a space
```

```
As a space owner
So that there is no issue with double booking
I don’t want to show booked space
```

```
As a space owner
So that I can hire out my space
I want to be able to confirm a booking request
```

```
As a space
Until a booking is confirmed
I can still be booked
```

## Set up the database 

1. Install and set up psql if required (Homebrew: `brew install postgresql`). 
2. Connect to `psql` via the Terminal
3. Create the development and test databases using the psql commands `CREATE DATABASE makersbnb;` and `CREATE DATABASE makersbnb_test;`
4. Connect to the development database using the pqsl command `\c makers_bnb;`
5. Run the queries saved in the files `01_create_users_table.sql`, `02_create_spaces_table.sql` and `03_create_bookings_table.sql`
6. Repeat step 5 after connecting to the test database: `\c makersbnb_test;`
