package main
import (
 "fmt"
 "net/http"
 "os"
)
func greet(w http.ResponseWriter, r *http.Request) {
 fmt.Fprintf(w, "You are served by host:%s.", os.Getenv("HOSTNAME"))
}
func main() {
 http.HandleFunc("/", greet)
 http.ListenAndServe(":8080", nil)
}
