Thank you for purchasing our product
Game Source v1
Developer and User Documentation
Game Source is Property of © Oakmont Technologies 2019

Developer Documentation
Welcome to Game Source v1 created by Oakmont Technologies. This documentation serves to familiarize the concept and tools used to create v1.

								Credits
		Pioneers:
		@Michael Galgoczy
		@Keith Meyer
		@Cristion Brown
		@Jake Trapp
		@Noah Black
		
		Contributors:
		@Mike Stahr
		
		© Oakmont Technologies 2019 

								Tech Stack
---Software and Programs
Microsoft Visual Studio 2017+
ASP.NET

---Languages
[Backend] C#, .NET, mySQL
[Frontend] Bootstrap, CSS, Javascript, HTML

								Software Development Method
Game Source v1 was created using an iterative development process which has taken about two months to complete.

								Key Components
Games are stored inside a database called GameSource which is composed of multiple tables, views and procedures;
 
			Tables:
				Games
				Reviews
				Users
				Additional ASP Generated Tables (this may vary on version)
				
			Views:
				vwReviews
				vwGames
				
			Procedures:
				submitGame
				getGames
				getGameByName
				getGameByID
				getUserByID
				getAverageRating
				submitReview
				getReviewsByGame
				deleteReview
				getRequests
				submitRequest
				deleteRequest

	Repositories:
		App_Start
		Content
		Properties
		Scripts
		bin
		fonts
		includes
		obj/Debug
		
	Files:
		Multiple .aspx/HTML/CS files for front end framework
		.jpg files for game images
		.config files for package configuration
		.js files for Javascript functions
	
								Implementation
1. Download project folder
2. Download Gamesource.sql (Database file) and run in Microsoft Visual Studio
	(this should be marked with a green arrow at the top left)
3. Open Oakmont Industries.sln in Microsoft Visual Studio
4. Switch to solution explorer view (view > Solution Explorer)
5. To view project, click on IIS Express (Google Chrome)
	(this should be marked with a green arrow at the top middle)
6. To edit project choose desired file and make changes


User Documenation
Welcome to Game Source v1 created by Oakmont Technologies. This documentation serves to familiarize the concept and tools used to create v1. Please use the user documentation to your advantage and explore the functionality of our system.

								Platform
Desktop Application accessuble on any computer. 

								Requirements:
Computer device capable of accessing an internet network.

								Key Pages
Home - Landing page of website
Game Catalog - Search for games using constraints/filters
Login - Login to your account
About - About GameSource
User Page - User capabilities page
Admin Page - Administration capabiltiies page
							
								Authorization Levels
None
User
Administrator
								
								Key Functionalities
[None]
Search Game on Game Catalog Page
Add Request on Request Page

[User]
Search Game on Game Catalog Page
Add Review on Game Page
Add Request on Request Page

[Administrator]
Add Review on Game Page
Remove Review on Game Page
Approve Request on Administration Page
Remove Request on Administration Page

								Accessing Admin and Normal User

To access Admin functionality, you must be logged in as an Admin.
1. Register an account for email:Admin@42 password:Admin@42	
2. This will stand in for your admin account, and you may access any admin functionality while logged in as such.

To access normal User functionality, you must be logged in.
1. Register an account with any email/password. Reccomended is user@gmail.com and Password$42
2. This will provide access to the user features, but not any admin features.

If you want to test [None Authorization], you can do so while logged in as either account, or not logged in at all.
