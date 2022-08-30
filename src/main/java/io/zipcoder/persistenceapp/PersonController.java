package io.zipcoder.persistenceapp;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;

@RestController
public class PersonController {

    private final PersonService personService;

    public PersonController(PersonService personService){
        this.personService=personService;
    }

    @PostMapping("/people")
    public ResponseEntity<Person> createPerson(@RequestBody Person person){
        return new ResponseEntity<>(personService.add(person), HttpStatus.CREATED);
    }

    @PutMapping("/people/{id}")
    public ResponseEntity<Person> updatePerson(@RequestBody Person person, @PathVariable Integer id){
        return new ResponseEntity<>(personService.update(person, id), HttpStatus.OK);
    }

    @GetMapping("/people/{id}")
    public ResponseEntity<Person> getPerson(@PathVariable Integer id){
        return new ResponseEntity<>(personService.getById(id), HttpStatus.OK);
    }

    @DeleteMapping("/people/{id}")
    public ResponseEntity<Boolean> deletePerson(@PathVariable Integer id){
        return new ResponseEntity<>(personService.remove(id), HttpStatus.OK);
    }

    @GetMapping("/people")
    public ResponseEntity<Iterable<Person>> getAllPerson(){
        return new ResponseEntity<>(personService.getPeople(), HttpStatus.OK);
    }

    @GetMapping("/people/reverselookup/{mobileNumber}")
    public ResponseEntity<Person> getPersonByPhone(@PathVariable String mobileNumber){
        return new ResponseEntity<>(personService.getByPhoneNumber(mobileNumber), HttpStatus.OK);
    }

    @GetMapping("/people/surname/{lastName}")
    public ResponseEntity<Iterable<Person>> getPeopleByLastName(@PathVariable String lastName){
        return new ResponseEntity<>(personService.getPeopleByLastName(lastName), HttpStatus.OK);
    }

    @GetMapping("/people/firstname/stats")
    public ResponseEntity<Map<String, Integer>> getFirstNameFreq(){
        return new ResponseEntity<>(personService.getFirstNameFrequencies(), HttpStatus.OK);
    }
}
