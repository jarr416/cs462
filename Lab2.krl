ruleset Lab2 {
  meta {
    name "Lab2"
    description <<
      Hello World from Lab2
    >>
    author "RJ Crandall"
    logging off
  }
  dispatch {
  }
  global {
  }
  rule first_rule {
    select when pageview '.*'
	{
    notify("Lab 2", "This is the first rule") with sticky = true;
	notify("Second Notification", "Modifying the first rule") with sticky = true;
	}
  }
  
  rule second_rule {
	select when pageview '.*'
	if page:url("query") then
		notify("Greetings", "Hello " + page:url("query")) with sticky = true;
	if not page:url("query") then
		notify("Lab 2", "Hello Monkey") with sticky = true;
  }
}