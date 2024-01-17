import ballerina/http;
import ballerina/os;
import ballerina/io;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {
        // Send a response back to the caller.
        string env = os:getEnv("SERVICE_URL");
        io:println("Service", env);
        string cid = os:getEnv("CLIENT_ID");
        io:println("Cid", cid);
        string ck = os:getEnv("CLIENT_SECRET");
        io:println("Service", ck);
        if name is "" {
            return error("name should not be empty!");
        }
        return "Hello, " + name;
    }
}
