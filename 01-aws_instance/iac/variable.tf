#################################################################
#                  EXAMPLES                                     #
#################################################################

# number variable 
variable "number_example"{
  description = "This is a guelo number"
  type        = number 
  default     = 42
}

# list variable 
variable "list_example"{
  description = "This is a guelo list"
  type        = list 
  default     = ["guelo", "queima" ]
}

# combine type constraints 
variable "list_numeric_example" {
  description = "Numeric list"
  type        = list(number)
  default     = [1,2, 3]
}

# here’s a map that requires all of the values to be strings: 
variable "map_example" {
  description = "An example of a map"
  type             = map(string)
  default          = {
    guelo: "queima"
    frequencia: "sempre"
  }
}

# strutural type using object 
variable "object_example" {
  description = "guelo information"
  type = object({
    name = string
    age  = number
    attributs = list(string)
    queima = bool
  })
  default = {
    name: "guelo"
    age = 24 
    attributs = [ "queimar", "sempre" ]
    queima = true
  }
}

#################################################################
#                  FINISH EXAMPLES                              #
#################################################################


variable "server_port" {
  description = "Server port to allow your app"
  type = number
}