package main

import (
	"fmt"
	"log"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Println("request coming!")
	fmt.Fprintf(w, "Hi Helloworld, I love %s!", r.URL.Path[1:])
}

func main() {
	fmt.Println("hello world!!")
	http.HandleFunc("/", handler)
	log.Fatal(http.ListenAndServe(":1323", nil))
}
