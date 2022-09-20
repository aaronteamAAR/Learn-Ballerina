import ballerina/io;
import ballerina/http;

public function main() returns error? {
    io:println("Hello, World!");


    http:Client cl = check new("https://disease.sh/v3/");
    CountryData[] data = check cl -> get("covid-19/countries");


    // CasePerPerson[] data2 = [];
    // foreach CountryData item in data {
    //     int casePerPerson = <int> decimal:ceiling( <decimal> item.population / <decimal> item.cases);
    //     CasePerPerson c = { country : item.country, casePerPerson : casePerPerson};

    //     data2.push(c);
    // }


            CasePerPerson[] data3 = from CountryData {country, cases, population} in data
            let int casePerPerson = <int> decimal:ceiling( <decimal> population / <decimal> cases)
            select { country : country, casePerPerson : casePerPerson};

            foreach CasePerPerson i in data3 {
                io:println(i);
            }
    
   
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


