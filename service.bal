import ballerina/io;
import ballerina/http;

// public function main() returns error? {

// }

service / on new http:Listener(9090) {

    resource function get albums() returns Album[] {
         return data.toArray();
    }

    resource function get albums/id/[int id]() returns json {

    }

    resource function post albums() returns json {

    }


    
}


type Album record {|

readonly int id;
string title;
string artist;
decimal price;
    
|};


table<Album> key(id) data = table[
    {
        id: 1, title: "ABC", artist: "John", price: 55.99
    },
    {
        id: 2, title: "xxx", artist: "Rema", price: 55.99
    },
    {
        id: 3, title: "Retrun", artist: "BigWiz", price: 55.99
    },
    {
        id: 4, title: "Ramsey", artist: "Davido", price: 55.99
    }
];