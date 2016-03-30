import http.requests.*;

void bls_stuff() {

  JSONObject json;
  JSONObject results;
  JSONArray series;
  
  processing.data.Table states;
  states = loadTable("API_data_table.csv", "header");

  println(states);
  TableRow find_state = states.findRow("Texas", "state_name");
  String state_code = find_state.getString("bls_state_code");
  
  processing.data.Table measures = loadTable("API_measure_table.csv", "header");
  
  TableRow find_comps = measures.findRow("Mining and Logging Jobs", "measure");
  String comp1 = find_comps.getString("component1");
  String comp2 = find_comps.getString("component2");
  //println(comp1+state_code+comp2);
  
  PostRequest post = new PostRequest("http://api.bls.gov/publicAPI/v1/timeseries/data/"+comp1+state_code+comp2);
  //////post.send();
  //////println("Reponse Content: " + post.getContent());
  ////json = parseJSONObject(post.getContent());
  ////results = json.getJSONObject("Results");
  ////series = results.getJSONArray("series");
  ////println(series);
}