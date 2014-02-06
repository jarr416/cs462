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
	pre {
		name = page:url("query");
	}
	if name then
		notify("Greetings", "Hello " + name) with sticky = true;
	if not name then
		notify("Greetings", "Hello Monkey") with sticky = true;
  }
}