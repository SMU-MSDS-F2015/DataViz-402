processing.data.Table blsData;

void bls_stuff() {
  blsData = loadTable("oil_jobs_data.csv", "header");
  int i=0;
  println("state_name\tstate_abbv\tDate\t\tValue");
  for (TableRow row : blsData.rows()) {
    println(row.getString("state_name") + "\t" + row.getString("state_abbv") + "\t" + row.getString("Date") + "\t\t" + row.getString("Value") );
    i++;
  }
}