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
	getVal = function(key) {
		//change & to =, split on =, and then use index + 1 to access value
		query = page:url("query").replace(re/&/g, "=");
		queries = query.split(re/=/);
		index = queries.index(key);

		value = (index < 0) => "Monkey" | queries[index + 1];
		value
	};
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
		name = page:url("query") => page:url("query") | "Monkey";
	}
	
	notify("Greetings", name) with sticky = true;
	
  }
}