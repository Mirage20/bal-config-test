import ballerina/http;

configurable string message = "Hello World";
configurable string 'from = ?;

type Greeting record {
    string 'from;
    string to;
    string message;
};

service / on new http:Listener(8290) {
    resource function get .(string? name) returns Greeting {
        Greeting greeting = {"from" : 'from, "to" : name?:"You", "message" : message};
        return greeting;
    }
}
