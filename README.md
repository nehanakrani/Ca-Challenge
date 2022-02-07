# Citizens Advice Challenge

# The Task: 
Create a ruby based application for a user registration and authentication system. It should be designed as a REST-ful API with JSON only responses, there is no need for views.
    ● Users need to be able to register with a username, email address and password (there is no need to send confirmation email).
    ● Users need to be able to authenticate with their username and password.
    ● When a user is successfully authenticated, the API needs to respond with a unique user token.
    ● Groups have a unique name and can have many users and users can
        belong to many groups.
    ● Some users have admin privileges and they need to be able to carry out the following actions using a valid user token:
        ○ Create groups.
        ○ Assign users to groups.        

# Solution Approach:

    ● Create Rails API using Ruby 2.7.0 and rails 5.2.1
    ● Create an Authenticate API for users with JWT(Due to time limit I have not covered all acpet such as confirming users via email and verifying users )
    ● For testing, I can attach here one Postman Link 
    ● Nothing is wrong with that approach but I’m fascinated to work with  test-driven development TDD workflow using unit testing or function testing. I can add them in ToDo to create rspec for whole code.
    ● Create user with admin flag true or false therefore didn’t go through with role based assignment in such case for different privileges, In solution we can use pudit either cancan to provide user to Authorization.
    ● Groups have a unique name and can have many users and users can belong to many groups.in that case, I have used  NxN (many to many) relationships therefore model generate it like this: Group/User relationship using join table has_many :users, :through => :members, For that I have only created methods to create groups and a method as assigned user in to group.
    ● As good as Rails is for building an API, it’s default responses leave something to be desired. That’s why we can use Active Model Serializers to structure the data we send back to the client appropriately. Due to time limit I haven’t implemented.
