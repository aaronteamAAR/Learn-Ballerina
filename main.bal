import ballerina/io;
import ballerina/http;

public function main() returns error? {
    io:println("Hello, World!");


    http:Client cl = check new("https://disease.sh/v3/");
    json[] data = check cl -> get("covid-19/countries");


    CasePerPerson[] data2 = [];
    foreach CountryData item in data {
        int casePerPerson = <int> decimal:ceiling( <decimal> item.population / <decimal> item.cases);
        CasePerPerson c = { country : item.country, casePerPerson : casePerPerson};

        data2.push(c);
    }
    
    io:println(data[0].country);
    io:println(data2);
}


type CountryData record {
   string country;
   int cases;
   int population;

};


type CasePerPerson record {
   string country;
   int casePerPerson;

};


