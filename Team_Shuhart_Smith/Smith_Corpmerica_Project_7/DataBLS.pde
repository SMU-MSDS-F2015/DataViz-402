import http.requests.*;

PostRequest post = new PostRequest("http://api.bls.gov/publicAPI/v1/timeseries/data/"+"LASST120000000000003");
post.send();
println("Reponse Content: " + post.getContent());
println("Reponse Content-Length Header: " + post.getHeader("Content-Length"));