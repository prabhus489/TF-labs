provider "github" {
  # Configuration options
  token = "<your github tocken>"

}


resource "github_repository" "example" {
  name = "terraform-repo"

  visibility = "private"


}
