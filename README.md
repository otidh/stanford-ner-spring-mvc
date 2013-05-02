# Using Stanford NER with Spring MVC


This project contains mini-sample that demonstrate the use of Stanford NER with Spring MVC. 

The application uses MVC Java-based configuration. See /web/WEB-INF/web.xml.

## How to Use (recommended to use NetBeans IDE):
1. Create new project, choose "Web application from existing sources".
2. Include the libraries needed.
3. Deploy the application. 
4. Navigate to the home page localhost:8080/stanford-ner-spring-mvc.
5. Pass some text to be processed as GET parameter.
        
    #### Example:

    The text to be processed: 
    `The BBC's Mark Lowen in Athens says there have been far fewer strikes and protests this year, and there is a feeling the civil unrest is beginning to die down.`
    
    Put it as parameter for the url:
    `http://localhost:8080/stanford-ner-spring-mvc?s=The%20BBC's%20Mark%20Lowen%20in%20Athens%20says%20there%20have%20been%20far%20fewer%20strikes%20and%20protests%20this%20year,%20and%20there%20is%20a%20feeling%20the%20civil%20unrest%20is%20beginning%20to%20die%20down.` 
    
    Then the page will return the output in json format, like this: 
    `{"organization":["BBC"],"time":[],"person":["Mark Lowen"],"percent":[],"location":["Athens"],"money":[],"date":[]}`



