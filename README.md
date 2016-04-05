# Active Record Lite
I have recreated the basic functionality of Active Record, which is the M in MVC.
Active Record is used by the model class which facilitates the the creation and
use of the business class and its interaction with the database.

## Created an SQL Object that interacts with the database
The SQL Object includes methods such as #all, #find, #insert, #update, and #save
which allows the model class to easily access the database without making
constant queries to the db. I also implemented getter and setter methods for the
columns in the database by using define_method.

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885175/Screen_Shot_2016-04-05_at_12.39.22_PM_q6j5gk.png)

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885148/Screen_Shot_2016-04-05_at_12.35.46_PM_sdbbf6.png)

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885148/Screen_Shot_2016-04-05_at_12.35.31_PM_ofjxk6.png)

The #where method allows the database to be searchable and filters the database
for conditions that are met.

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885373/Screen_Shot_2016-04-05_at_12.42.30_PM_xoeowf.png)


## Associatables
Created belongs_to, has_many, and has_many_through methods with default values

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885597/Screen_Shot_2016-04-05_at_12.44.50_PM_dqbcag.png)

![alt tag] (http://res.cloudinary.com/ddefvho7g/image/upload/v1459885671/Screen_Shot_2016-04-05_at_12.47.22_PM_ihqhty.png)
